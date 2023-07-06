import 'package:food_delivery/model/menu_model.dart';

class RestoModel {
  String restoName;
  double restoRating;
  double restoDistance;
  String restoImage;
  String restoJudges;
  String restoLocation;
  String restoEstPrice;
  int estMinimum;
  int estMaximum;
  List<String> restoCategory;
  List<MenuModel> restoMenu;
  bool isRecommended;


  RestoModel({
    required this.restoName,
    required this.restoRating,
    required this.restoDistance,
    required this.restoJudges,
    required this.restoLocation,
    required this.restoImage,
    required this.restoEstPrice,
    required this.estMinimum,
    required this.estMaximum,
    required this.restoCategory,
    required this.restoMenu,
    required this.isRecommended, 
  });


}
