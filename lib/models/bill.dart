import 'dart:convert';

import '../models/order.dart';
import 'employee.dart';

class Bill {
  final int id;
  final DateTime created;
  final Employee employee;
  List<Order> orders;

  Bill({
    required this.id,
    required this.created,
    required this.employee,
    required this.orders,
  });

  double totalOfBill() {
    double total = 0;
    for (int i = 0; i < orders.length; i++) {
      total += orders[i].total();
    }
    return total;
  }

  Map toJson() => {
        'id': id,
        'created': created.toString(),
        'employee': jsonEncode(employee),
        'orders': jsonEncode(orders)
      };
}
