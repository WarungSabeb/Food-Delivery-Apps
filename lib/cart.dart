// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/Profile.dart';
import 'package:food_delivery/Cart.dart';
import 'package:food_delivery/history.dart';
import 'package:food_delivery/main_screen/gofood.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _selectedIndex = 2;

  final List<Map> runner = [
    {
      'restaurant': 'Pizza Hut',
      'date': '25 Jun 2023, 17:32',
      'price': 'Rp66.500',
      'status' : 'On The Way'
    },
    {
      'restaurant': 'Burger King',
      'date': '25 Jun 2023, 17:13',
      'price': 'Rp58.000',
      'status' : 'At The Restaurant'
    },
  ];

  void _onTappedBottomNav(int index) {
    final scaffold = ScaffoldMessenger.of(context);
    // List<String> menuBottomNav = ['Home', 'History', 'Cart', 'Profile'];
    List menuBottomNav = [gofood(), History(), Cart(), Profile()];
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      Navigator.push(context,MaterialPageRoute(builder: (context) => menuBottomNav.elementAt(index)));

    }
  }

  SafeArea buildHeader() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: 15,
          left: 10,
          right: 10,
          bottom: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 48, width:10),

            Text(
                    'My Cart',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            
            Material(
              elevation: 2,
              child: buildHeader(),
            ),
            SizedBox(height: 5),

            // _tabSection(context)
            
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
            ),
          ],
        ),

          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled, size: 35),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long, size: 35),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, size: 35),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 35),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black,
            onTap: _onTappedBottomNav,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        )
      )
      
    );
  }
}