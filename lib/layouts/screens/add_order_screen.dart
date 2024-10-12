// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_bill_app/constant/my_color.dart';

// init values for course info
String orderName = "...";
double price = 0;
int quantity = 0;

class AddOrderScreen extends StatelessWidget {
  final Function()? addOrder;

  AddOrderScreen({required this.addOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'add order',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: MyColors.theme,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 125,
                child: TextField(
                  cursorColor: MyColors.theme,
                  style: TextStyle(color: MyColors.theme),
                  decoration: InputDecoration(
                    hintText: 'order name',
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                  onChanged: (newOrderName) {
                    orderName = newOrderName;
                  },
                ),
              ),
              SizedBox(
                width: 75,
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(5),
                  ],
                  cursorColor: MyColors.theme,
                  style: TextStyle(color: MyColors.theme),
                  decoration: InputDecoration(
                    hintText: 'price',
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                  onChanged: (newPrice) {
                    try {
                      price = double.parse(newPrice);
                    } catch (e) {
                      print('can not convert to double');
                    }
                  },
                ),
              ),
              SizedBox(
                width: 75,
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(5),
                  ],
                  cursorColor: MyColors.theme,
                  style: TextStyle(color: MyColors.theme),
                  decoration: InputDecoration(
                    hintText: 'quantity',
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                  onChanged: (newQuantity) {
                    try {
                      quantity = int.parse(newQuantity);
                    } catch (e) {
                      print('can not convert to integer');
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          TextButton(
            onPressed: addOrder,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: MyColors.theme,
            ),
            child: Text('add'),
          )
        ],
      ),
    );
  }
}
