import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restaurant_bill_app/models/employee.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeesData extends ChangeNotifier {
  List<Employee> employees = [
    Employee(
      id: 0,
      name: 'admin',
      password: 'admin',
      phoneNumber: '0000',
      start: DateTime.now(),
    ),
  ];

  Future<void> saveEmployees() async {
    if (employees.isNotEmpty) {
      final pref = await SharedPreferences.getInstance();
      var dataToJson = jsonEncode(employees);
      pref.setString('employees', dataToJson);
    }
    notifyListeners();
  }

  Future<void> getEmployees() async {
    final prefs = await SharedPreferences.getInstance();
    String dataJson = prefs.getString('employees') ?? 'no employees';

    if (dataJson != 'no employees') {
      var dataFromJson = jsonDecode(dataJson);
      employees = [];

      for (var employee in dataFromJson) {
        employees.add(Employee(
          id: employee['id'],
          name: employee['name'],
          password: employee['password'],
          phoneNumber: employee['phone'],
          start: DateTime.parse(employee['start']),
        ));
      }
      notifyListeners();
    }
  }

  void addEmployee(int id, String name, String password, String phoneNumber,
      DateTime start) {
    employees.add(Employee(
        id: id,
        name: name,
        password: password,
        phoneNumber: phoneNumber,
        start: start));
    saveEmployees();
    notifyListeners();
  }
}
