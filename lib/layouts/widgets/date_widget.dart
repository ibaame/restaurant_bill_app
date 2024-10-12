// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../utils/utils.dart';

DateTime dateTime = DateTime.now();
String dateFormat = getDate(dateTime);
String date = getDate(dateTime);

class GetDate extends StatefulWidget {
  @override
  State<GetDate> createState() => _GetDateState();
}

class _GetDateState extends State<GetDate> {
  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    dateFormat = getDate(dateTime);
    date = getDate(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        DateTime? newDate = await showDatePicker(
          context: context,
          initialDate: dateTime,
          firstDate: DateTime(1900),
          lastDate: DateTime(2200),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.grey,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black, // button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
        );
        if (newDate == null) return;
        setState(() {
          dateTime = newDate;
          dateFormat = getDate(dateTime);
          date = getDate(dateTime);
        });
      },
      child: Row(
        children: [
          const Icon(
            Icons.calendar_month,
            color: Colors.grey,
            size: 22,
          ),
          SizedBox(width: 5),
          Text(
            dateFormat,
            style: TextStyle(color: Colors.grey, fontSize: 13.5),
          )
        ],
      ),
    );
  }
}
