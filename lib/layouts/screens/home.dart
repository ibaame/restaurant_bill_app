import 'package:flutter/material.dart';
import 'package:restaurant_bill_app/constant/my_color.dart';
import 'package:restaurant_bill_app/layouts/screens/previous_bills.dart';
import 'package:restaurant_bill_app/layouts/screens/settings.dart';
import 'package:restaurant_bill_app/layouts/screens/stats.dart';
import 'package:restaurant_bill_app/models/employee.dart';

import 'add_employee.dart';
import 'create_bill.dart';
import 'employees.dart';

class Home extends StatelessWidget {
  final Employee employee;
  final DateTime dateTime;
  const Home({super.key, required this.employee, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    var features = [
      CardFeature(
        title: 'create bill',
        icon: Icons.create,
        route: CreateBill(employee: employee),
      ),
      const CardFeature(
          title: 'previous bills', icon: Icons.list, route: PreviousBills()),
      CardFeature(
          title: 'add employee',
          icon: Icons.add,
          route: AddEmployee(
            employee: employee,
          )),
      CardFeature(
          title: 'stats', icon: Icons.analytics, route: Stats(employee)),
      CardFeature(
          title: 'employees', icon: Icons.people, route: Employees(employee)),
      const CardFeature(
          title: 'settings', icon: Icons.settings, route: Settings()),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.theme,
        title: const Text('Home Page'),
        centerTitle: true,
        leading: const SizedBox(),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                      'time of login: ${dateTime.year}/${dateTime.month}/${dateTime.day} - ${dateTime.hour}:${dateTime.minute}'),
                  Text('employee: ${employee.name}'),
                ],
              ),
            ),
          ),
          productsGridView(context, features),
        ],
      ),
    );
  }

  Widget productsGridView(BuildContext context, features) {
    return Expanded(
      child: GridView(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
            mainAxisExtent: MediaQuery.of(context).size.height / 3.7,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5),
        children: features,
      ),
    );
  }
}

///// ====

class CardFeature extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget route;
  const CardFeature(
      {super.key,
      required this.title,
      required this.icon,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => route,
            ),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: MyColors.theme,
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: MyColors.theme,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
