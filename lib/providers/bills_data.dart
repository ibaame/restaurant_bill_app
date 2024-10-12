import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restaurant_bill_app/models/bill.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/employee.dart';
import '../models/order.dart';

class BillsData extends ChangeNotifier {
  List<Bill> bills = [];

  Future<void> saveBills() async {
    if (bills.isNotEmpty) {
      final pref = await SharedPreferences.getInstance();
      var dataToJson = jsonEncode(bills);
      print(dataToJson);
      pref.setString('bills', dataToJson);
    }
    notifyListeners();
  }

  Future<void> getBills() async {
    final prefs = await SharedPreferences.getInstance();
    String dataJson = prefs.getString('bills') ?? 'no bills';

    if (dataJson != 'no bills') {
      var dataFromJson = jsonDecode(dataJson);
      bills = [];

      for (var bill in dataFromJson) {
        bills.add(
          Bill(
            id: bill['id'],
            created: DateTime.parse(bill['created']),
            employee: employeeFromJson(bill['employee']),
            orders: ordersFromJson(bill['orders']),
          ),
        );
      }
      notifyListeners();
    }
  }

  Employee employeeFromJson(String employeeAsString) {
    Map<String, dynamic> employee = jsonDecode(employeeAsString);
    return Employee(
      id: employee['id'],
      name: employee['name'],
      password: employee['password'],
      phoneNumber: employee['phone'],
      start: DateTime.parse(employee['start']),
    );
  }

  List<Order> ordersFromJson(String ordersAsString) {
    List<dynamic> orders = jsonDecode(ordersAsString);
    List<Order> orderList = [];
    for (Map order in orders) {
      orderList.add(Order(
          name: order['name'],
          quantity: order['quantity'],
          price: order['price']));
    }
    return orderList;
  }

  void addBill(
      int id, DateTime created, Employee employee, List<Order> orders) {
    bills.add(
        Bill(id: id, created: created, employee: employee, orders: orders));
    saveBills();
    notifyListeners();
  }
}
