class Employee {
  final int id;
  final String name;
  final String password;
  final String phoneNumber;
  final DateTime start;

  Employee({
    required this.id,
    required this.name,
    required this.password,
    required this.phoneNumber,
    required this.start,
  });

  Map toJson() => {
        'id': id,
        'name': name,
        'phone': phoneNumber,
        'password': password,
        'start': start.toString(),
      };
}
