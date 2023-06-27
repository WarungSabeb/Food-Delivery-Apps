// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/data/resto_data.dart';
import 'package:food_delivery/model/resto_model.dart';
import 'package:food_delivery/widget/main_screen_widget.dart';

class gofood extends StatefulWidget {
  gofood({Key? key}) : super(key: key);

  @override
  _gofoodState createState() => _gofoodState();
}

class _gofoodState extends State<gofood> {
  int _selectedIndex = 0;
  var _verticalPadding = 10.0;
  var _horizontalPadding = 10.0;

  final String _alamat = "Home";

  void _onTappedBottomNav(int index) {
    final scaffold = ScaffoldMessenger.of(context);
    List<String> menuBottomNav = ['Explore', 'Pencarian', 'Favorit'];
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
      if (index == 1) {
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
  }

    SafeArea buildHeader() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: _verticalPadding,
          left: _horizontalPadding,
          right: _horizontalPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Hi Buddies',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'Order & Eat',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor: Color.fromARGB(255, 249, 154, 186),
              child: Icon(
              Icons.person,
              color: Colors.black,
              size: 40,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            
          ],
        ),
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // this for header
          buildHeader(),
          SizedBox(
            height: 10,
          ),
          // to call search box
          // SearchBox(),

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
                    SearchBox(),
                    SizedBox(height: 10),
                     
                    BannerWidget(),

                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                            'Categories',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    ),

                    
                    SizedBox(
                      height: 5,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Container(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          IconCardWidget(
                            iconAssets: 'assets/images/icon/nasi.png',
                            iconTitle: 'Aneka Nasi',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconCardWidget(
                            iconAssets: 'assets/images/icon/sweet.png',
                            iconTitle: 'Jajanan',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconCardWidget(
                            iconAssets: 'assets/images/icon/minuman.png',
                            iconTitle: 'Minuman',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconCardWidget(
                            iconAssets: 'assets/images/icon/roti.png',
                            iconTitle: 'Roti',
                          ),
                           SizedBox(
                            width: 10,
                          ),
                            IconCardWidget(
                            iconAssets: 'assets/images/icon/cepat saji.png',
                            iconTitle: 'Cepat Saji',
                          ),                         
                        ],
                      ),
                    ),
                    ),
                    
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                                  'Populer',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // Text(
                          //   'Hanya buat kamu, iya kamu :)',
                          //   style: TextStyle(
                          //     fontSize: 12,
                          //   ),
                          // ),
                          SizedBox(
                            height: 10,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Container(
                              height: 170,
                              width: 700,
                              child: GridView.count(
                                scrollDirection: Axis.horizontal,
                                crossAxisCount: 1,
                                crossAxisSpacing:
                                    MediaQuery.of(context).size.width * 0.01,
                                mainAxisSpacing:
                                    MediaQuery.of(context).size.width * 0.01,
                                children: restoDataList
                                    .where((rec) => rec.isRecommended)
                                    .toList()
                                    .map((resto) {
                                  return RestoCardMarkotop(
                                    restoName: resto.restoName,
                                    rating: resto.restoRating,
                                    penilai: resto.restoJudges,
                                    resto: resto,
                                  );
                                }).toList(),
                              ),
                            ),
                          )
                          
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Resto Tersedia di Area Kamu',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Kami cariin yang dekat dan mantap lo!',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 15),
                          ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: restoDataList.length,
                            itemBuilder: (context, index) {
                              final RestoModel resto = restoDataList[index];
                              return UniversalContent(
                                jarakResto: resto.restoDistance,
                                rating: resto.restoRating,
                                categoryResto: resto.restoCategory.join(", "),
                                restoPlace: resto.restoLocation,
                                restoName: resto.restoName,
                                estMin: resto.estMinimum,
                                estMax: resto.estMaximum,
                                resto: resto,
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pencarian',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onTappedBottomNav,
      ),
    );
  }


}
