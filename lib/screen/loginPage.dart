// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_tre/screen/HomePage.dart';
import 'package:news_tre/screen/RegistrationPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  final bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/login.jpeg"),
                  fit: BoxFit.cover,
                )),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      Text(
                        "Sign in to your",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Account",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 55,
            ),
            SizedBox(
              width: 360,
              child: TextField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    errorText: _validate ? 'Phone number cant be empty' : null,
                    focusColor: Colors.grey,
                    fillColor: Colors.grey,
                    label: const Text("Email "),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(11))),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(11)))),
                controller: phoneController,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 360,
              child: TextField(
                onTap: () {
                  setState(() {});
                },
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    errorText: _validate ? 'password cant be empty' : null,
                    focusColor: Colors.grey,
                    fillColor: Colors.grey,
                    labelText: "Password",
                    suffixIcon: const Icon(Icons.visibility),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(11))),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(11)))),
                controller: passwordController,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 270, top: 15),
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    color: Color(0xff3860C1),
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width / 1.13,
              height: MediaQuery.of(context).size.height / 16,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              color: Colors.black,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false);
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    height: 10,
                    thickness: 1,
                    color: Colors.grey,
                    endIndent: 20,
                    indent: 20,
                  ),
                ),
                Text(
                  "Or login with",
                  style: TextStyle(color: Colors.black),
                ),
                Expanded(
                  child: Divider(
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90, top: 50),
              child: Row(
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()),
                      );
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          color: Color(0xff3860C1),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
