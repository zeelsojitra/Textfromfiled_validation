import 'package:flutter/material.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final name = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final bod = TextEditingController();
  final mobileno = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  bool passwordcheck = true;
  bool confirampassword = true;

  final frmo = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: frmo,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter name";
                  }
                },
                controller: name,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: "Enter Name",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Last name";
                  }
                },
                controller: lastname,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: "Enter Last Name",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Email";
                  } else if (value.isValidEmail() != true) {
                    return "please enter valid email";
                  }
                },
                controller: email,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  hintText: "Enter Email",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter bod";
                  }
                },
                controller: bod,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today_sharp),
                  border: OutlineInputBorder(),
                  hintText: "Enter Bod",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter mobile no";
                  } else if (value.length != 10) {
                    return "Enter valid mobile no";
                  }
                },
                controller: mobileno,
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  border: OutlineInputBorder(),
                  hintText: "Enter Mobile No",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  RegExp regex = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (value!.isEmpty) {
                    return "Enter password";
                  } else if (!regex.hasMatch(value)) {
                    return "password is week";
                  }
                },
                obscureText: passwordcheck,
                controller: password,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordcheck = !passwordcheck;
                      });
                    },
                    icon: passwordcheck
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                  prefixIcon: Icon(Icons.security),
                  border: OutlineInputBorder(),
                  hintText: "Enter Password",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Confirm password";
                  } else if (value != password.text) {
                    return "Confirm password can not be same";
                  }
                },
                obscureText: confirampassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          confirampassword = !confirampassword;
                        });
                      },
                      icon: confirampassword
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility)),
                  prefixIcon: Icon(Icons.security),
                  border: OutlineInputBorder(),
                  hintText: "Enter Confirm Password",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (frmo.currentState!.validate()) {
                      print("Success");
                    }
                  },
                  child: Text("Signup"))
            ],
          ),
        ),
      ),
    );
  }
}
