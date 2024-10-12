import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/my_color.dart';
import '../../providers/employees_data.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool visibility = true;

  String message = 'enter username and password';

  _LoginState() {
    usernameController.text = '';
    passwordController.text = '';
    visibility = true;
    message = 'enter username and password';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.theme,
        centerTitle: true,
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 80),
              Text(message),
              const SizedBox(height: 25),
              username(),
              password(),
              const SizedBox(height: 25),
              TextButton(
                onPressed: () {
                  for (int i = 0;
                      i <
                          Provider.of<EmployeesData>(context, listen: false)
                              .employees
                              .length;
                      i++) {
                    if (usernameController.text ==
                            Provider.of<EmployeesData>(context, listen: false)
                                .employees[i]
                                .name &&
                        passwordController.text ==
                            Provider.of<EmployeesData>(context, listen: false)
                                .employees[i]
                                .password) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Home(
                            employee: Provider.of<EmployeesData>(context,
                                    listen: false)
                                .employees[i],
                            dateTime: DateTime.now(),
                          ),
                        ),
                      );
                      break;
                    }
                  }
                  setState(() {
                    message = 'username or password is wrong';
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MyColors.theme),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                  child: Text(
                    "log in",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget username() {
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
            controller: usernameController,
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

  Widget password() {
    return Column(
      children: [
        const Align(alignment: Alignment.topLeft, child: Text('password')),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 5),
          decoration: BoxDecoration(
            color: MyColors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: passwordController,
            obscuringCharacter: '•',
            obscureText: visibility,
            cursorColor: MyColors.secondaryGrey,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              hintText: 'password',
              hintStyle:
                  const TextStyle(fontSize: 18, color: MyColors.secondaryGrey),
              suffixIcon: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    visibility = !visibility;
                  });
                },
                icon: visibility
                    ? const Icon(Icons.visibility_off_rounded)
                    : const Icon(Icons.visibility_rounded),
              ),
              suffixIconColor: MyColors.black,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
