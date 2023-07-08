// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/main_screen/cart.dart';
import 'package:food_delivery/model/menu_model.dart';
import 'package:food_delivery/model/resto_model.dart';
import 'package:food_delivery/widget/resto_screen_widget.dart';

class RestoScreen extends StatefulWidget {
  final RestoModel data;

  RestoScreen({required this.data});

  @override
  State<RestoScreen> createState() => _RestoScreenState();
}

class _RestoScreenState extends State<RestoScreen> {
  // const RestoScreen({Key? key}) : super(key: key);
  final _verticalPadding = 10.0;

  final _horizontalPadding = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
                vertical: _verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Text(
                      widget.data.restoName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black87,
                        fontSize: 17,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 10),
                  FavoriteButton(),
                  SizedBox(width: 10),
                  Icon(
                    Icons.share,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.data.restoName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.data.restoCategory.join(", "),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 60,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          // rating
                          RestoReviewWidget(
                            keterangan: '${widget.data.restoJudges} ratings',
                            iconsValue: '${widget.data.restoRating}',
                            iconsColor: Colors.orange,
                            icons: Icons.star,
                          ),
                          VerticalDivider(
                            color: Colors.black54,
                            thickness: 0.6,
                            width: 25,
                          ),
                          // jarak
                          RestoReviewWidget(
                            keterangan: 'Distance',
                            iconsValue: '${widget.data.restoDistance} km',
                            iconsColor: Colors.orange,
                            icons: Icons.location_on,
                          ),
                          VerticalDivider(
                            color: Colors.black54,
                            thickness: 0.6,
                            width: 25,
                          ),
                          // Harga
                          RestoReviewWidget(
                            keterangan: 'Price',
                            iconsValue: '< ${widget.data.restoEstPrice}',
                            iconsColor: Colors.orange,
                            icons: Icons.monetization_on,
                          ),
                          VerticalDivider(
                            color: Colors.black54,
                            thickness: 0.6,
                            width: 25,
                          ),
                          // Rasa
                          RestoReviewWidget(
                            keterangan: 'Great taste',
                            iconsValue: '100+ ratings',
                            iconsColor: Colors.orange,
                            icons: Icons.thumb_up,
                          ),
                          VerticalDivider(
                            color: Colors.black54,
                            thickness: 0.6,
                            width: 25,
                          ),
                          RestoReviewWidget(
                            keterangan: 'Value for money',
                            iconsValue: '100+ rating',
                            iconsColor: Colors.orange,
                            icons: Icons.rice_bowl_rounded,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),



                    Divider(
                      height: 20,
                      thickness: 0.5,
                      color: Colors.black26,
                    ),
                    ListView.builder(
                     physics: NeverScrollableScrollPhysics(),
                     padding: EdgeInsets.zero,
                     shrinkWrap: true,
                     itemCount: widget.data.restoMenu.length,
                     itemBuilder: (context, index) {
                       final MenuModel menu = widget.data.restoMenu[index];
                       return menu.isFoodAvailable
                           ? MenuListAvailable(
                               foodImage: menu.foodImage,
                               foodName: menu.foodMenu,
                               foodDetail: menu.foodDescription,
                               foodPrice: menu.foodPrice,
                               restoName: widget.data.restoName,
                             )
                           : MenuListUnvailable(
                               foodImage: menu.foodImage,
                               foodName: menu.foodMenu,
                               foodDetail: menu.foodDescription,
                             );
                     },
                   ),

                    SizedBox(height: 30)
                  ],
                ),
              ),
            ),
          ),
          // Container(
          //   alignment: Alignment.center,
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.push(context,
          //                       MaterialPageRoute(
          //                           builder: (context) => Cart(foodName: 'foodName', foodPrice: 1, quantity: 1, restoName: 'restoName', foodImage: 'assets/images/kuliner/ayam.jpg')));

          //     },
          //     child: Container(
          //       // width: 200,
          //       margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(30),
          //         color: Colors.pink,
          //       ),
          //       child: Center(
          //         child: Padding(
          //           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          //           child: Text(
          //            'Order',
          //            style: TextStyle(
          //              color: Colors.white,
          //              fontSize: 25,
          //            ),
          //          ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
