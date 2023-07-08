// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/main_screen/gofood.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/main_screen/signup.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final phone = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: MediaQuery.of(context).size.height / 3,
                          child: Image.asset('assets/images/tasty.jpg'),
                        ),

                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          
                          child: TextField(
                            controller: phone,
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.phone_android,
                                color: Colors.pink,
                              ),
                              hintText: 'Phone',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),

                        const SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          
                          child: TextField(
                            controller: password,
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.lock_open,
                                color: Colors.pink,
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),

                        const SizedBox(height: 100),
                        Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(
                            //         builder: (context) => gofood()));
                           final scaffold = ScaffoldMessenger.of(context);
                           scaffold.showSnackBar(
                             SnackBar(
                               duration: Duration(seconds: 1),
                               content: Text(
                                 'Wrong Phone Number or Password',
                                 overflow: TextOverflow.ellipsis,
                                 style: TextStyle(color: Colors.black),
                               ),
                               action: SnackBarAction(
                                 label: 'Ok',
                                 onPressed: scaffold.hideCurrentSnackBar,
                               ),
                               backgroundColor: Colors.white,
                             ),
                           );
                          },
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.pink,
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          
                        ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child:TextButton(
                            onPressed: () {
                                Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                            }, 
                            child: Text(
                              'DONT HAVE AN ACCOUNT? SIGN UP',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12
                              ),
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}