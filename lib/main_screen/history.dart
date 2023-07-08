// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/main_screen/Profile.dart';
import 'package:food_delivery/main_screen/gofood.dart';
import 'package:intl/intl.dart';
import 'package:food_delivery/database/database.dart';

final oCcy = NumberFormat("#,##0", "en_US");
class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int _selectedIndex = 1;
  final AppDb database = AppDb();
  DateTime now = DateTime.now();
  List<OrderData> orders = [];

  final List<Map> runner = [
    {
      'restaurant': 'Pizza Hut',
      'date': '25 Jun 2023, 17:32',
      'price': 66500,
      'status' : 'On The Way'
    },
    {
      'restaurant': 'Burger King',
      'date': '25 Jun 2023, 17:13',
      'price': 58000,
      'status' : 'At The Restaurant'
    },
  ];

  final List<Map> historian = [
    {
      'restaurant': 'Pizza Hut',
      'date': '22 Jun 2023, 17:32',
      'price': 86500,
    },
    {
      'restaurant': 'Burger King',
      'date': '20 Jun 2023, 04:20',
      'price': 108000,
    },
  ];

  void _onTappedBottomNav(int index) {
    List menuBottomNav = [gofood(), History(), Profile()];
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
                    'Orders',
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

  Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: Material(
            elevation: 3,
            child: TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.pink,
              indicatorColor: Colors.pink,
              
              tabs: [
                Tab(text: 'Running'),
                Tab(text: "History"),
          ]),
          )
        ),
        Expanded( 
          child: TabBarView(children: [

            ListView(
              children: [
                Container(
                      height:MediaQuery.of(context).size.height - 180,
                      child: ListView.builder(
                       itemCount: orders.length,
                       itemBuilder: (context, index) {
                         return Column(
                           children: [
                             _running(index),
 
                           ],
                         );
                       },
                     ),
                    ),
                ],
            ),
            ListView(
              children: [
                for (final historian in historian)
                _history(historian['restaurant'], historian['date'], historian['price']),
              ],
            ),
          ]),
        ),
      ],
    ),
  );
}




Widget _running(int index) {
  final order = orders[index];
  String convertedDateTime = "${order.orderTime.year.toString()}-${order.orderTime.month.toString().padLeft(2,'0')}-${order.orderTime.day.toString().padLeft(2,'0')} ${order.orderTime.hour.toString().padLeft(2,'0')}:${order.orderTime.minute.toString().padLeft(2,'0')}";
    return Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        child: ListTile(
          onTap: () {},
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Color.fromARGB(255, 249, 154, 186),
            child: Icon( Icons.fastfood, color: Colors.white,),
          ),
          title: Text(
            order.restoName,
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
          subtitle: Text(
            convertedDateTime.toString(),
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
          trailing: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(height: 10),
              Text('Rp ${oCcy.format(order.price)}'),
              SizedBox(height: 5),
              Text('Making Your Order'),
            ],
          ),
        ),
      ),
    );
}




Widget _history(String restaurant, String date, int price) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        child: ListTile(
          onTap: () {},
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Color.fromARGB(255, 249, 154, 186),
            child: Icon( Icons.fastfood, color: Colors.white,),
          ),
          title: Text(
            restaurant,
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
          subtitle: Text(
            date,
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
          trailing: 
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // SizedBox(height: 10),
              Text('Rp ${oCcy.format(price)}'),
              // SizedBox(height: 5),
              // Text('On The Way'),
            ],
          ),
        ),
      ),
    );
}




  @override
  Widget build(BuildContext context) {
    database.getAllOrders().then((fetchedOrders) {
      setState(() {
        orders = fetchedOrders;
      });
    });
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            
            Material(
              elevation: 2,
              child: buildHeader(),
            ),
            SizedBox(height: 5),

            
            Expanded(
              child: _tabSection(context),
              // child: Container(
              //     color: Colors.white,
              //         height:MediaQuery.of(context).size.height - 180,
              //         child: ListView.builder(
              //          itemCount: orders.length,
              //          itemBuilder: (context, index) {
              //            return Column(
              //              children: [
              //                _running(index),
              //                SizedBox(height: 20,)
 
              //              ],
              //            );
              //          },
              //        ),
              //       ),
              )
            
            
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
                icon: Icon(Icons.person, size: 35),
                label: 'Profile',
              ),
            ],
            currentIndex: 1,
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