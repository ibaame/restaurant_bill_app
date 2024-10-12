import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_bill_app/layouts/screens/login.dart';
import 'package:restaurant_bill_app/providers/bills_data.dart';

import '../../constant/my_color.dart';
import '../../providers/employees_data.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<EmployeesData>(context).getEmployees();
    Provider.of<BillsData>(context).getBills();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.theme,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/invoice.svg',
              color: MyColors.theme,
              width: 50,
            ),
            const SizedBox(height: 100),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: MyColors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'welcome to restaurant bill app',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 35),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MyColors.theme)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                child: Text(
                  "start",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
