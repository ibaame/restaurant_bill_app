import 'package:flutter/material.dart';

import '../../constant/my_color.dart';
import '../../models/bill.dart';
import '../../models/order.dart';
import '../../utils/utils.dart';

class BillDetails extends StatelessWidget {
  final Bill bill;
  const BillDetails({super.key, required this.bill});

  double totalCost() {
    double cost = 0;
    for (int i = 0; i < bill.orders.length; i++) {
      cost += (bill.orders[i].price * bill.orders[i].quantity);
    }
    return cost;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.theme,
        title: Text('Bill #${bill.id}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('employee: ${bill.employee.name}'),
                    Text('time: ${getDate(bill.created)}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('orders ${bill.orders.length}'),
                Text('total cost: ${totalCost()}'),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('order'),
                  Text('price'),
                  Text('quantity'),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: bill.orders.length,
                itemBuilder: (context, index) => OrderCard(
                  order: bill.orders[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ========== widget

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(order.name),
            Text('${order.price}'),
            Text('${order.quantity}'),
          ],
        ),
      ),
    );
  }
}
