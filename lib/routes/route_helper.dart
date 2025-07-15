import 'package:app1/pages/food/popular_food_detail.dart';
import 'package:app1/pages/food/recommended_food_detail.dart';
import 'package:app1/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
   static const String recommendedFood = "/recommended-food";
 static String getPopularFood()=> '$popularFood';
 static String getRecommendedFood()=>'$recommendedFood';
 static String getInitial()=>'$initial';

  static List <GetPage> routes=[
    GetPage(name: initial, page:()=> MainFoodPage()),
    GetPage(name: popularFood, page: ()=> PopularFoodDetail(),
    transition: Transition.fadeIn,
    ),
    GetPage(name: recommendedFood, page:()=>RecommendedFoodDetail(),
    transition: Transition.fadeIn
    ),
  ];

}