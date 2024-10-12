import 'package:flutter/material.dart';
import 'package:restaurant_bill_app/constant/my_color.dart';
import 'package:restaurant_bill_app/utils/utils.dart';

import '../../models/employee.dart';

class EmployeeDetails extends StatelessWidget {
  final int loggedEmployeeId;
  final Employee employee;
  const EmployeeDetails(
      {super.key, required this.loggedEmployeeId, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('employee ${employee.id}'),
        centerTitle: true,
      ),
      body: loggedEmployeeId == 0
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  cardInfo('ID', employee.id.toString()),
                  cardInfo('name', employee.name),
                  cardInfo('phone number', employee.phoneNumber),
                  cardInfo('start', getDate(employee.start)),
                ],
              ),
            )
          : const Center(
              child: Text('only admin can see details of employee'),
            ),
    );
  }

  Container cardInfo(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: MyColors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '$title: $value',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
