import 'package:app1/pages/home/food_page_body.dart';
import 'package:app1/utilis/colors.dart';
import 'package:app1/utilis/dimensions.dart';
import 'package:app1/widgets/big_text.dart';
import 'package:app1/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("Current height is " + MediaQuery.of(context).size.height.toString()); 
     print("Current width is " + MediaQuery.of(context).size.width.toString()); 
   
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.getHeight(45), bottom: Dimensions.getHeight(15)),
              padding: EdgeInsets.only(left: Dimensions.getWidth(20), right: Dimensions.getWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Bangladesh", color: AppColors.mainColor),
                      Row(
                        children: [
                          SmallText(text: "Nersingdi", color: Colors.black54),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.getWidth(45),
                      height: Dimensions.getHeight(45),
                      child: Icon(Icons.search, color: Colors.white, size:Dimensions.getHeight(24)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.getHeight(15)),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
         //showing the body 
          Expanded(child: SingleChildScrollView(child: FoodPageBody())),
        ],
      ),
    );
  }
}
