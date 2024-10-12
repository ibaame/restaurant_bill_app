class Order {
  final String name;
  final int quantity;
  final double price;

  Order({
    required this.name,
    required this.quantity,
    required this.price ,
  });

  double total() {
    return quantity * price;
  }

  Map toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
      };
}
