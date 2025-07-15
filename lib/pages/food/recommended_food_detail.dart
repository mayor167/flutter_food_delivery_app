import 'package:app1/controllers/recommended_product_controller.dart';
import 'package:app1/routes/route_helper.dart';
import 'package:app1/utilis/app_constants.dart';
import 'package:app1/utilis/colors.dart';
import 'package:app1/utilis/dimensions.dart';
import 'package:app1/widgets/app_icon.dart';
import 'package:app1/widgets/big_text.dart';
import 'package:app1/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductLsit[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
         physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: Dimensions.getHeight(75),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon(Icons.shopping_cart_outlined),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.clear)),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              ),
              bottom: PreferredSize(preferredSize: Size.fromHeight(20),
               child: Container(
                child: Center(child: BigText(size:Dimensions.getHeight(26) , text: product.name!)),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: Dimensions.getHeight(5), bottom: Dimensions.getHeight(10)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.getHeight(20)),topRight: Radius.circular(Dimensions.getHeight(20))),
                   color: Colors.white,
                ),
               ),
               ),
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              expandedHeight: Dimensions.getHeight(300),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child:Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: Dimensions.getWidth(20),right: Dimensions.getWidth(20)
                  ),
                    child: ExpandableTextWidget(text:product.description!,),
                  ),
                ],
              ),
            ),
          ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: Dimensions.getWidth(50), right: Dimensions.getWidth(50), top: Dimensions.getHeight(10), bottom: Dimensions.getHeight(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize:Dimensions.getHeight(24) ,
                  iconColor:Colors.white, backgroundColor:AppColors.mainColor ,icon:Icons.remove),
                 BigText(text: "\$ ${product.price!}  X  0 ", color: AppColors.mainBlackColor, size: Dimensions.getHeight(26),),
                AppIcon(
                  iconSize:Dimensions.getHeight(24) ,
                  iconColor:Colors.white, backgroundColor:AppColors.mainColor ,icon:Icons.add),
              ],
            ),
          ),
           Container(
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
              child: Icon(Icons.favorite, color: AppColors.mainColor,),
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
              child: BigText(text: "\$ ${product.price!} | Add to cart", color: Colors.white),
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}