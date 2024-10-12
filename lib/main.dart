import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_bill_app/layouts/screens/start_screen.dart';
import 'package:restaurant_bill_app/providers/employees_data.dart';

import 'providers/bills_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EmployeesData>(
          create: (_) => EmployeesData(),
        ), 
        ChangeNotifierProvider<BillsData>(
          create: (_) => BillsData(),
        ),
      ],
      child: MaterialApp(
        title: 'Restaurant Bill',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: const StartScreen(),
      ),
    );
  }
}
