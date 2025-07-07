import 'package:app1/pages/home/food_page_body.dart';
import 'package:app1/utilis/colors.dart';
import 'package:app1/widgets/big_text.dart';
import 'package:app1/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MainFoodPageDarkMode extends StatefulWidget {
  const MainFoodPageDarkMode({super.key});

  @override
  State<MainFoodPageDarkMode> createState() => _MainFoodPageDarkModeState();
}

class _MainFoodPageDarkModeState extends State<MainFoodPageDarkMode> {
  @override
  Widget build(BuildContext context) {
    print("Current height is " + MediaQuery.of(context).size.height.toString()); 
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          //showing the header
          Container(
            // color: Colors.black,
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
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
                      width: 45,
                      height: 45,
                      child: Icon(Icons.search, color: Colors.white),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
         //showing the body 
          FoodPageBody(),
        ],
      ),
    );
  }
}
