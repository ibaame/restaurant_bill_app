import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_bill_app/providers/employees_data.dart';

import '../../constant/my_color.dart';
import '../../models/employee.dart';
import '../../providers/bills_data.dart';

class Stats extends StatelessWidget {
  final Employee employee;
  const Stats(this.employee, {super.key});

  @override
  Widget build(BuildContext context) {
    //
    String allMoney() {
      double money = 0;
      for (int i = 0; i < Provider.of<BillsData>(context).bills.length; i++) {
        money += Provider.of<BillsData>(context).bills[i].totalOfBill();
      }
      return money.toString();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.theme,
        title: const Text('Stats'),
      ),
      body: employee.id == 0
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  cardInfo(
                      'number of employees',
                      Provider.of<EmployeesData>(context)
                          .employees
                          .length
                          .toString()),
                  cardInfo('number of bills',
                      Provider.of<BillsData>(context).bills.length.toString()),
                  cardInfo('money', allMoney())
                ],
              ),
            )
          : const Center(
              child: Text('only admin can see stats'),
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
