import 'package:app1/pages/home/main_food_page.dart';
import 'package:app1/utilis/colors.dart';
import 'package:app1/utilis/dimensions.dart';
import 'package:app1/widgets/app_column.dart';
import 'package:app1/widgets/app_icon.dart';
import 'package:app1/widgets/big_text.dart';
import 'package:app1/widgets/expandable_text_widget.dart';
import 'package:app1/widgets/icon_and_text_widget.dart';
import 'package:app1/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.getHeight(350),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png"),
                ),
              ),
            ),
          ),
          //icon widgets
          Positioned(
            top: Dimensions.getHeight(45),
            left: Dimensions.getWidth(20),
            right: Dimensions.getWidth(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:(){
                    Get.to(()=>MainFoodPage());
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios)),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          //Introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.getHeight(330),
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.getWidth(20),
                right: Dimensions.getWidth(20),
                top: Dimensions.getHeight(20),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.getHeight(20)),
                  topLeft: Radius.circular(Dimensions.getHeight(20)),
                ),
                color: Colors.white,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Chinese Side"),
                  SizedBox(height: Dimensions.getHeight(20)),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.getHeight(20)),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text:
                            "Chicken marinated in a blend of spices, herbs, and acidic ingredients is soaked to absorb deep flavor and become more tender. The marinade typically includes elements like lemon juice or vinegar (for tenderizing), oil or yogurt (to keep the meat juicy), and seasonings such as garlic, pepper, or herbs. This process allows the chicken to develop a rich, well-balanced taste before it’s cooked—whether grilled, baked, or fried—resulting in a more flavorful and succulent dish.",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.getHeight(120),
        padding: EdgeInsets.only(
          top: Dimensions.getHeight(30),
          bottom: Dimensions.getHeight(30),
          left: Dimensions.getWidth(20),
          right: Dimensions.getWidth(20),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.getHeight(40)),
            topRight: Radius.circular(Dimensions.getHeight(40)),
          ),
          color: AppColors.buttonBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.getHeight(15),
                bottom: Dimensions.getHeight(15),
                left: Dimensions.getWidth(20),
                right: Dimensions.getWidth(20),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.getHeight(20)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor),
                  SizedBox(width: Dimensions.getWidth(5)),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.getWidth(5)),
                  Icon(Icons.add, color: AppColors.signColor),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.getHeight(15),
                bottom: Dimensions.getHeight(15),
                left: Dimensions.getWidth(20),
                right: Dimensions.getWidth(20),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.getHeight(20)),
                color: AppColors.mainColor,
              ),
              child: BigText(text: "\$10 | Add to cart", color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
