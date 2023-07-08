// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:food_delivery/main_screen/login.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/main_screen/gofood.dart';
import 'package:food_delivery/database/database.dart';
import 'package:food_delivery/global.dart' as global;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  final name = TextEditingController();

  final AppDb database = AppDb();

  //   Future insert(
  //     TextEditingController email, 
  //     TextEditingController password, 
  //     TextEditingController phone, 
  //     TextEditingController name,) async {
  //   final row = await database.into(database.user).insertReturning(
  //       UserCompanion.insert(
  //         email: email.text,
  //         password: password.text,
  //         phone: phone.text,
  //         name: name.text
  //         )
  //       );
  // }
//   Future insert(
//     TextEditingController email,
//     TextEditingController password,
//     TextEditingController phone,
//     TextEditingController name,
// ) async {
//     final existingRecord = await database.user
//         .select(database.user)
//         .where((user) => user.phone.equals(phone.text))
//         .getSingleOrNull();

//     if (existingRecord != null) {
//         // A record with the same phone number already exists
//         // You can handle this case, such as showing an error message or taking appropriate action
//         return;
//     }

//     final row = await database.into(database.user).insertReturning(
//         UserCompanion.insert(
//             email: email.text,
//             password: password.text,
//             phone: phone.text,
//             name: name.text,
//         ),
//     );
// }

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

                        SizedBox(
                          width: 150,
                          height: MediaQuery.of(context).size.height / 3,
                          child: Image.asset('assets/images/tasty.jpg'),
                        ),
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
                            controller: email,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.pink,
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                        
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

                         const SizedBox(height: 20),
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

                         const SizedBox(height: 20),
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
                            controller: name,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.pink,
                              ),
                              hintText: 'Name',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
                        Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                          onTap: () {
                            global.username = name.text;
                            global.useremail = email.text;
                            global.userphone = phone.text;
                            // insert(email, password, phone, name);
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => gofood()));
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
                                  'Sign Up',
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
                                    builder: (context) => LoginScreen()));
                            }, 
                            child: Text(
                              'ALREADY HAVE AN ACCOUNT ?',
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