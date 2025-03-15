import 'package:flutter/material.dart';
import 'package:praktpm2tugas/homepage.dart';

class Loginpage2 extends StatefulWidget {
  const Loginpage2({super.key});

  @override
  State<Loginpage2> createState() => _Loginpage2State();
}

bool isloginSuccess = true;

class _Loginpage2State extends State<Loginpage2> {
  String username = "";

  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 65, 210, 250),
          title: Text("Login Page"),
        ),
        body: Column(
          children: [_usernameField(), _passwordField(), _loginbutton(context)],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: "username",
          contentPadding: EdgeInsets.all(18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: InputDecoration(
          hintText: "Password",
          contentPadding: EdgeInsets.all(18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }

  Widget _loginbutton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String message = "";
          if (username == "aku" && password == "ganteng") {
            setState(() {
              message = "login Success";
              isloginSuccess = true;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Homepage(username: username),
                ),
              );
            });
          } else {
            setState(() {
              message = "login Failed";
              isloginSuccess = false;
            });
          }
          SnackBar fitbar = SnackBar(
            content: Text(message),
            backgroundColor: (isloginSuccess) ? Colors.green : Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(fitbar);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Color.fromARGB(255, 7, 53, 139),
          backgroundColor: Color.fromARGB(255, 65, 210, 250),
        ),
        child: Text("Login"),
      ),
    );
  }
}
