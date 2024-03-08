// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:news_tre/screen/HomePage.dart';
import 'package:news_tre/screen/loginPage.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  register(String email, String password) async {
    if (email == "" && password == "") {
    } else {
      // ignore: unused_local_variable
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
          return null;
        });
        // ignore: unused_catch_clause, empty_catches
      } on FirebaseAuthException catch (ex) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/signin.jpg"),
                  fit: BoxFit.cover,
                )),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 130,
                      ),
                      Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            Text(
                              "Create your account",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 360,
              child: TextField(
                decoration: const InputDecoration(
                    focusColor: Colors.grey,
                    fillColor: Colors.grey,
                    label: Text("Full Name"),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(11))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(11)))),
                controller: TextEditingController(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 360,
              child: TextField(
                decoration: const InputDecoration(
                    label: Text("Email "),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(11))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(11)))),
                controller: TextEditingController(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 360,
              child: TextField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: const InputDecoration(
                    labelText: "Password",
                    suffixIcon: Icon(Icons.visibility),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(11))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(11)))),
                controller: TextEditingController(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 360,
              child: TextField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: const InputDecoration(
                    labelText: "Repeat Password",
                    suffixIcon: Icon(Icons.visibility),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(11))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(11)))),
                controller: TextEditingController(),
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width / 1.13,
              height: MediaQuery.of(context).size.height / 16,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              color: Colors.black,
              onPressed: () {
                register(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Register",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90, top: 40),
              child: Row(
                children: [
                  const Text(
                    "I have an account? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                          (Route<dynamic> route) => false);
                    },
                    child: const Text(
                      "Log in",
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
