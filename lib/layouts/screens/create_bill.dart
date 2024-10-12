import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_bill_app/models/employee.dart';
import 'package:restaurant_bill_app/providers/bills_data.dart';

import '../../constant/my_color.dart';

import '../../models/order.dart';
import 'add_order_screen.dart';

List<Order> ordersList = [];

class CreateBill extends StatefulWidget {
  final Employee employee;
  const CreateBill({super.key, required this.employee});

  @override
  State<CreateBill> createState() => _CreateBillState();
}

class _CreateBillState extends State<CreateBill> {
  List<Order> orders = ordersList;
  double totalCost() {
    double cost = 0;
    for (int i = 0; i < orders.length; i++) {
      cost += (orders[i].price * orders[i].quantity);
    }
    return cost;
  }

  @override
  void initState() {
    orders.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.theme,
        title: const Text('Create Bill'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            backgroundColor: MyColors.theme,
            onPressed: () {
              setState(() {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddOrderScreen(
                        addOrder: () {
                          setState(() {
                            ordersList.add(Order(
                                name: orderName,
                                quantity: quantity,
                                price: price));
                            orderName = '...';
                            price = 0;
                            quantity = 0;
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                );
              });
            },
            child: const Icon(Icons.add),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(MyColors.theme),
            ),
            onPressed: () {
              if (orders.isNotEmpty) {
                Provider.of<BillsData>(context, listen: false).addBill(
                  Provider.of<BillsData>(context, listen: false).bills.length +
                      1,
                  DateTime.now(),
                  widget.employee,
                  orders,
                );
                Navigator.pop(context);
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: Text(
                'pay',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () {
              ordersList.clear();
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: Text(
                'cancel',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                    'bill #${Provider.of<BillsData>(context).bills.length + 1}'),
                Text('orders ${orders.length}'),
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
              child: orders.isEmpty
                  ? const Center(child: Text('no orders'))
                  : ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) => OrderCard(
                        order: orders[index],
                        delete: () {
                          setState(() {
                            orders.remove(orders[index]);
                          });
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========

class OrderCard extends StatelessWidget {
  final Order order;
  final Function()? delete;
  const OrderCard({super.key, required this.order, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        onLongPress: delete,
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
      ),
    );
  }
}
