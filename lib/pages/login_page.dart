import 'package:flutter/material.dart';
// routes
import 'package:flutter_application/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool isButtonChanged = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_img.png",
              fit: BoxFit.cover,
              // height: 1000.0,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter username",
                      labelText: "Username",
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  isButtonChanged = true;
                });
                await Future.delayed(
                  Duration(seconds: 1),
                );
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: isButtonChanged ? 50 : 150,
                height: 50,
                alignment: Alignment.center,
                child: isButtonChanged
                    ? Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    : Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(isButtonChanged ? 50 : 8),
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, MyRoutes.homeRoute);
            //   },
            //   style: TextButton.styleFrom(
            //     minimumSize: Size(120.0, 40.0),
            //   ),
            //   child: Text('Login'),
            // ),
          ],
        ),
      ),
    );
  }
}
