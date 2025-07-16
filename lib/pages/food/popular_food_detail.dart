import 'package:app1/controllers/cart_controller.dart';
import 'package:app1/controllers/popular_product_controller.dart';
import 'package:app1/pages/home/main_food_page.dart';
import 'package:app1/utilis/app_constants.dart';
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
  int pageId;
   PopularFoodDetail({super.key, required this.pageId});
  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductLsit[pageId];
  // print("page is id" + pageId.toString());
  // print("Product name is" + product.name.toString());
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
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
                  image: NetworkImage(AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img! ),
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
                  child: AppIcon(icon: Icons.arrow_back_ios)
                  ),
              GetBuilder<PopularProductController>(builder: (controller){
                return Stack(

                  children: [
                    AppIcon(icon: Icons.shopping_cart_outlined),
                    Get.find<PopularProductController>().totalItems>=1?
                    Positioned(
                      right: 0,
                      top: 0,
                      child: AppIcon(icon: Icons.circle, size: 20, iconColor: Colors.transparent,backgroundColor: AppColors.mainColor,)):
                    Container(),
                      Get.find<PopularProductController>().totalItems>=1?
                    Positioned(
                      right: 4,
                      top: 1,
                      child: BigText(text:Get.find<PopularProductController>().totalItems.toString(), size:12, color: Colors.white,),
                      ):
                    Container(),
                  ],
                );
              }),
                
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
                  AppColumn(text: product.name!),
                  SizedBox(height: Dimensions.getHeight(20)),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.getHeight(20)),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text:product.description!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
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
                  GestureDetector(
                     onTap: (){
                          popularProduct.setQuantity(false);
                    },
                    child: Icon(Icons.remove, color: AppColors.signColor)),
                  SizedBox(width: Dimensions.getWidth(5)),
                  BigText(text: popularProduct.inCartItems.toString()),
                  SizedBox(width: Dimensions.getWidth(5)),
                  GestureDetector(
                    onTap: (){
                          popularProduct.setQuantity(true);
                    },
                    child: Icon(Icons.add, color: AppColors.signColor,)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.getHeight(15),
                  bottom: Dimensions.getHeight(15),
                  left: Dimensions.getWidth(15),
                  right: Dimensions.getWidth(15),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.getHeight(20)),
                  color: AppColors.mainColor,
                ),
                child: GestureDetector(
                  onTap:(){
                    popularProduct.addItem(product);
                  },
                  child: BigText(text: "\$ ${product.price!} | Add to cart", color: Colors.white,)),
              ),
            ),
          ],
        ),
      );
      }),
    );
  }
}
