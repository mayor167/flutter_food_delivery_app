import 'package:app1/utilis/colors.dart';
import 'package:app1/utilis/dimensions.dart';
import 'package:app1/widgets/app_column.dart';
import 'package:app1/widgets/app_icon.dart';
import 'package:app1/widgets/big_text.dart';
import 'package:app1/widgets/icon_and_text_widget.dart';
import 'package:app1/widgets/small_text.dart';
import 'package:flutter/material.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.getHeight(350),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png"))
              ),
          )
          ),
          Positioned(
            top:Dimensions.getHeight(45),
             left: Dimensions.getWidth(20),
             right: Dimensions.getWidth(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                 AppIcon(icon: Icons.shopping_cart_outlined),
              ],

          ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top:Dimensions.getHeight(330),
            child: Container(
              
              padding: EdgeInsets.only(left: Dimensions.getWidth(20), right: Dimensions.getWidth(20), top: Dimensions.getHeight(20)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.getHeight(20)),topLeft: Radius.circular(Dimensions.getHeight(20))),
                 color: Colors.white,
                ),
               
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Chinese Side"),
                  SizedBox(height:Dimensions.getHeight(20),),
                  BigText(text: "Introduce"),
                ],
              ),
            )
            ),
        
        ],
      ),
      bottomNavigationBar: Container(
            height: Dimensions.getHeight(120),
            padding: EdgeInsets.only(top:Dimensions.getHeight(30), bottom: Dimensions.getHeight(30), left: Dimensions.getWidth(20),right: Dimensions.getWidth(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.getHeight(40)), topRight: Radius.circular(Dimensions.getHeight(40)),),
              color: AppColors.buttonBackgroundColor,
            ),
      ),
    );
  }
}