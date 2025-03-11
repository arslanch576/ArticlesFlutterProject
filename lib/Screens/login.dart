import 'package:flutter/material.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? emailError;
  String? passwordError;

  void onSubmit() {
    String email = emailController.text;
    String password = passwordController.text;

    setState(() {
      if(!email.contains("@")){
        emailError="Enter proper email";
        return;
      }
      emailError=null;


      if(password.length<6){
        passwordError="Password must be atleast 6 character";
        return;
      }
      passwordError=null;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter email",
                labelText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                errorText: emailError,
                suffixText: ".com",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                  hintText: "Enter password",
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  errorText: passwordError,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye)),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(onPressed: onSubmit, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
