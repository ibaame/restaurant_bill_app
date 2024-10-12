import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/my_color.dart';
import '../../models/employee.dart';
import '../../providers/employees_data.dart';
import 'employee_details.dart';

class Employees extends StatelessWidget {
  final Employee employee;
  const Employees(this.employee, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.theme,
        title: const Text('employees'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: Provider.of<EmployeesData>(context).employees.length,
          itemBuilder: (context, index) => Card(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EmployeeDetails(
                        loggedEmployeeId: employee.id,
                        employee: Provider.of<EmployeesData>(context)
                            .employees[index]),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                    '${Provider.of<EmployeesData>(context).employees[index].id} - ${Provider.of<EmployeesData>(context).employees[index].name}'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
