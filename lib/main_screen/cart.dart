// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/main_screen/Profile.dart';
import 'package:food_delivery/main_screen/history.dart';
import 'package:food_delivery/main_screen/gofood.dart';
import 'package:intl/intl.dart';

List<String> list = <String>['Cash', 'Card'];
final oCcy = NumberFormat("#,##0", "en_US");

class Cart extends StatefulWidget {
  final String foodName;
  final int foodPrice;
  int quantity;
  final String restoName;
  final String foodImage;

  Cart({
    required this.foodName,
    required this.foodPrice,
    required this.quantity, 
    required this.restoName, 
    required this.foodImage, 
  });

  @override
  _CartState createState() => _CartState();
}



class _CartState extends State<Cart> {
  int _selectedIndex = 2;
  int totalPrice = 0;
  int dfee = 10000;
  int sfee = 5000;
  TextEditingController noteController = TextEditingController();
  String paymentMethod = 'Cash';

  @override
  void initState() {
    super.initState();
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    int price = widget.foodPrice;
    totalPrice = price * widget.quantity;
  }

  void _incrementQuantity() {
  setState(() {
    widget.quantity++;
    totalPrice = widget.foodPrice * widget.quantity;
  });
}

void _decrementQuantity() {
  setState(() {
    if (widget.quantity > 0) {
      widget.quantity--;
      totalPrice = widget.foodPrice * widget.quantity;
    }
  });
}

  void _onTappedBottomNav(int index) {
    List menuBottomNav = [gofood(), History(), Cart(
                                foodName: "Ayam",
                                foodPrice: 10000,
                                quantity: 1,
                                restoName: 'KFC',
                                foodImage: 'assets/images/kuliner/bakso-mie.jpg',
                              ), Profile()];
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [


            SizedBox(height: 48, width:10),

            IconButton(onPressed: () {Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back)),

            SizedBox(height: 48, width:98),

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

    Widget Address() {
    return Material(
              shape: Border(bottom: BorderSide(color: Colors.grey)),
              child: Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: [

                  SizedBox(height: 60, width:20),


                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Address'),
                      SizedBox(height: 8),
                      Container(
                        width: 180,
                        child: Text(
                          'Jalan Permata ujung No. 13', 
                          style: TextStyle(fontWeight: FontWeight.bold), 
                          overflow: TextOverflow.ellipsis,
                          softWrap: false
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                  SizedBox(width: 90,),
                  OutlinedButton(
                    onPressed: () {}, 
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.pink),
                    ),
                    child: Text('Change', style: TextStyle(color: Colors.pink),),
                  ),

                  ],
                ),
              ),
            );
    }

    Widget cartOrder(String name, int price, String image, int quantity) {
    return Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Material(
                        // elevation: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color.fromRGBO(255, 135, 179, 1),
                            boxShadow: <BoxShadow>[
                              
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1,
                                offset: Offset(0, 3)
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 15,),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  image: AssetImage(image),
                                  width: 80,
                                  height: 100,
                              ),
                              ),
                              SizedBox(width: 15,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10,),
                                  Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 30,),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: _decrementQuantity,
                                        child: Container(
                                          padding: const EdgeInsets.all(3.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Icon(Icons.remove, color: Colors.black, size: 18,),
                                        ),
                                      ),
                                      SizedBox(width: 15.0),
                                      Text(widget.quantity.toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                                      SizedBox(width: 15.0),
                                      GestureDetector(
                                        onTap: _incrementQuantity,
                                        child: Container(
                                          padding: const EdgeInsets.all(3.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Icon(Icons.add, color: Colors.black, size: 18,),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(height: 5,),
                                  Text('Rp ${oCcy.format(price)}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 40,),
                                  Text('Rp ${oCcy.format(price * widget.quantity)}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 5,),
                                ],
                              ),
                              ),
                              SizedBox(width: 10,),
                              


                            ],
                          ),
                        ),
                      ),
                      );
    }

    Widget Counter() {
      return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              if (widget.quantity > 0){
                widget.quantity -= 1;
              }
              
            });
          },
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              // border: Border.all(),
              borderRadius: BorderRadius.circular(5)
            ),
            child: Icon(Icons.remove, color: Colors.black, size: 18,),
          ),
        ),
        SizedBox(width: 15.0),
        Text("$widget.quantity", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
        SizedBox(width: 15.0),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.quantity += 1;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5)
            ),
            child: Icon(Icons.add, color: Colors.black, size: 18,),
          ),
        ),
      ],
    );
  }


String dropdownValue = list.first;

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
            

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Address(),
                    SizedBox(height: 20),
                    cartOrder(widget.foodName, widget.foodPrice, widget.foodImage, widget.quantity),
                    
                    SizedBox(height: 10),
                    // cartOrder('Bakso Mercon', 25000, 'assets/images/kuliner/bakso-mie.jpg'),


                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Note', style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 3,),
                          Container(
                            height: 30,
                            child: TextField(
                            decoration: InputDecoration(
                              hintText: ' (add some notes)',
                              hintStyle: TextStyle(fontSize: 12),
                            ),
                          ),
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Items Total: '),
                              Text('Rp ${oCcy.format(totalPrice)}', style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Delivery fee:'),
                              Text('Rp ${oCcy.format(dfee)}', style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Service fee:'),
                              Text('Rp ${oCcy.format(sfee)}', style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total:', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                              Text('Rp ${oCcy.format(totalPrice + dfee + sfee)}', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                    
                    Material(
                      elevation: 5, 
                      child: Column(
                        children: [
                          Divider(thickness: 1,color: Colors.grey,),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Payment Method', style: TextStyle(fontWeight: FontWeight.bold),),
                                    Row(
                                      children: [
                                        DropdownButton<String>(
                                      value: dropdownValue,
                                      icon: const Icon(Icons.expand_more, color: Colors.black,),
                                      elevation: 20,
                                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      underline: SizedBox(),
                                      alignment: Alignment.bottomLeft,

                                      onChanged: (String? value) {
                                        setState(() {
                                          dropdownValue = value!;
                                        });
                                      },
                                      items: list.map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      ),
                                      SizedBox(width: 10,)
                                      ],
                                    )
                                    
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ),
                    SizedBox(height: 30,),
                    Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => gofood()));
                          },
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.pinkAccent,
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Checkout',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ),
                        SizedBox(height: 20,)

                  ]
                  ),
              ),
            ),

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
            currentIndex: 2,
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