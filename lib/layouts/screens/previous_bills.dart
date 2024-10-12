import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_bill_app/providers/bills_data.dart';

import '../../constant/my_color.dart';

import 'bill_details.dart';

class PreviousBills extends StatelessWidget {
  const PreviousBills({super.key});

  @override
  Widget build(BuildContext context) {
    var billsList = Provider.of<BillsData>(context).bills.reversed.toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.theme,
        title: const Text('Previous Bills'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: billsList.isEmpty
            ? const Center(
                child: Text('no bills'),
              )
            : ListView.builder(
                itemCount: billsList.length,
                itemBuilder: (context, index) => Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BillDetails(
                            bill: billsList[index],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('#${billsList[index].id}'),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
