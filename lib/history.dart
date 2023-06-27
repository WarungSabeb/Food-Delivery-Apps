// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int _selectedIndex = 0;

  void _onTappedBottomNav(int index) {
    final scaffold = ScaffoldMessenger.of(context);
    List<String> menuBottomNav = ['Home', 'History', 'Cart', 'Profile'];
    // List menuBottomNav = [gofood(), History(), Cart(), Profile()];
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      // Navigator.push(context,MaterialPageRoute(builder: (context) => menuBottomNav.elementAt(index)));
        
        // Hapus aja kalo udh ada halamannya
        scaffold.showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            content: Text(
              '${menuBottomNav.elementAt(index)} was clicked',
              style: TextStyle(color: Colors.red),
            ),
            action: SnackBarAction(
              label: 'Close',
              onPressed: scaffold.hideCurrentSnackBar,
            ),
            backgroundColor: Colors.white,
          ),
        );
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

            SizedBox(width: 65),

            Text(
                    'Your Cart History',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
            ),

            SizedBox(width: 25),

            IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.shopping_cart_outlined,)
            ),

            
            
          ],
        ),
      ),
    );
  }

  Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 3,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: TabBar(tabs: [
            Tab(text: "Home"),
            Tab(text: "Articles"),
            Tab(text: "User"),
          ]),
        ),
        Container( 
          //Add this to give height
          // height: MediaQuery.of(context).size.height,
          height: 200,
          child: TabBarView(children: [
            Container(
              child: Text("Home Body"),
            ),
            Container(
              child: Text("Articles Body"),
            ),
            Container(
              child: Text("User Body"),
            ),
          ]),
        ),
      ],
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
            SizedBox(height: 5,),

            // Container(),
            // buildHeader()
            Material(
              elevation: 5,
              child: _tabSection(context),
            ),
            
          ],
        ),
      )
    );
  }
}