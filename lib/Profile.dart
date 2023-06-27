// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/signup.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(240,91,145,1.000),
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240,91,145,1.000),
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

                        SizedBox(height: 30),

                        Container(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Color.fromRGBO(217,217,217,1.000),
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 60,
                              ),
                          ),
                        ),

                        SizedBox(height: 40),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                          
                          child: const TextField(
                            enabled: false,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding:  EdgeInsets.only(left: 5),
                                child: CircleAvatar(
                                radius: 5,
                                backgroundColor: Color.fromRGBO(255,38,116,0.49),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 25,
                                  ),
                              ),

                              ),
                              hintText: '    Mr. X',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                        
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                          
                          child: const TextField(
                            enabled: false,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding:  EdgeInsets.only(left: 5),
                                child: CircleAvatar(
                                radius: 5,
                                backgroundColor: Color.fromRGBO(255,38,116,0.49),
                                child: Icon(
                                  Icons.mail,
                                  color: Colors.white,
                                  size: 25,
                                  ),
                              ),

                              ),
                              hintText: '    Email@email.com',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),

                         const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                          
                          child: const TextField(
                            enabled: false,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding:  EdgeInsets.only(left: 5),
                                child: CircleAvatar(
                                radius: 5,
                                backgroundColor: Color.fromRGBO(255,38,116,0.49),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                  size: 25,
                                  ),
                              ),

                              ),
                              hintText: '    081289614330',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),

                         const SizedBox(height: 20),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                          
                          child: const TextField(
                            enabled: false,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding:  EdgeInsets.only(left: 5),
                                child: CircleAvatar(
                                radius: 5,
                                backgroundColor: Color.fromRGBO(255,38,116,0.49),
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 25,
                                  ),
                              ),

                              ),
                              hintText: '    Address',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
                        
                        Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                          
                          child: const TextField(
                            enabled: false,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding:  EdgeInsets.only(left: 5),
                                child: CircleAvatar(
                                radius: 5,
                                backgroundColor: Color.fromRGBO(255,38,116,0.49),
                                child: Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                  size: 25,
                                  ),
                              ),

                              ),
                              hintText: '    Log Out',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
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