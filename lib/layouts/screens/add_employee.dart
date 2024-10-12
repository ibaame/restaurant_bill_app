import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_bill_app/layouts/widgets/date_widget.dart';
import 'package:restaurant_bill_app/models/employee.dart';
import 'package:restaurant_bill_app/providers/employees_data.dart';

import '../../constant/my_color.dart';

// ignore: must_be_immutable
class AddEmployee extends StatelessWidget {
  final Employee employee;
  AddEmployee({super.key, required this.employee});

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.theme,
        title: const Text('Add Employee'),
      ),
      body: employee.id == 0
          ? addEmployeeInputs(context)
          : const Center(
              child: Text('only admin can add employees'),
            ),
    );
  }

  SingleChildScrollView addEmployeeInputs(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            id(),
            name(),
            password(),
            phoneNumber(),
            const SizedBox(height: 15),
            start(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                      child: Text(
                        'cancel',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyColors.theme),
                    ),
                    onPressed: () {
                      Provider.of<EmployeesData>(context, listen: false)
                          .addEmployee(
                              int.parse(idController.text),
                              nameController.text,
                              passwordController.text,
                              phoneNumberController.text,
                              dateTime);
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                      child: Text(
                        'add',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget id() {
    return Column(
      children: [
        const Align(alignment: Alignment.topLeft, child: Text('id')),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: MyColors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: idController,
            cursorColor: MyColors.secondaryGrey,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              hintText: 'id',
              hintStyle: TextStyle(fontSize: 18, color: MyColors.secondaryGrey),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget name() {
    return Column(
      children: [
        const Align(alignment: Alignment.topLeft, child: Text('name')),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: MyColors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: nameController,
            cursorColor: MyColors.secondaryGrey,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              hintText: 'name',
              hintStyle: TextStyle(fontSize: 18, color: MyColors.secondaryGrey),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget phoneNumber() {
    return Column(
      children: [
        const Align(alignment: Alignment.topLeft, child: Text('phone number')),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: MyColors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: phoneNumberController,
            cursorColor: MyColors.secondaryGrey,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              hintText: 'phone number',
              hintStyle: TextStyle(fontSize: 18, color: MyColors.secondaryGrey),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget password() {
    return Column(
      children: [
        const Align(alignment: Alignment.topLeft, child: Text('password')),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: MyColors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: passwordController,
            cursorColor: MyColors.secondaryGrey,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              hintText: 'password',
              hintStyle: TextStyle(fontSize: 18, color: MyColors.secondaryGrey),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget age() {
    return Column(
      children: [
        const Align(alignment: Alignment.topLeft, child: Text('age')),
        GetDate(),
      ],
    );
  }

  Widget start() {
    return Column(
      children: [
        const Align(alignment: Alignment.topLeft, child: Text('start')),
        GetDate(),
      ],
    );
  }
}
