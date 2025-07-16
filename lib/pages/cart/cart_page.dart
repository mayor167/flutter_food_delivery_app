import 'package:app1/controllers/cart_controller.dart';
import 'package:app1/pages/home/main_food_page.dart';
import 'package:app1/utilis/app_constants.dart';
import 'package:app1/utilis/colors.dart';
import 'package:app1/utilis/dimensions.dart';
import 'package:app1/widgets/app_icon.dart';
import 'package:app1/widgets/big_text.dart';
import 'package:app1/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.getHeight(60),
            left: Dimensions.getWidth(20),
            right: Dimensions.getWidth(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.getHeight(24),
                ),
                SizedBox(width: Dimensions.getWidth(100)),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>MainFoodPage());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.getHeight(24),
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.getHeight(24),
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.getHeight(100),
            left: Dimensions.getWidth(20),
            right: Dimensions.getWidth(20),
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.getHeight(15)),
              // color: Colors.red,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(
                  builder: (cartController) {
                    return ListView.builder(
                      itemCount: cartController.getItems.length,
                      itemBuilder: (_, index) {
                        return Container(
                          width: double.maxFinite,
                          height: Dimensions.getHeight(100),
                          margin: EdgeInsets.only(
                            bottom: Dimensions.getHeight(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: Dimensions.getWidth(100),
                                height: Dimensions.getHeight(100),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstants.BASE_URL + AppConstants.UPLOAD_URL +cartController.getItems[index].img!),
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.getHeight(20),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: Dimensions.getWidth(10)),
                              Expanded(
                                child: Container(
                                  height: Dimensions.getHeight(100),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(
                                        text: cartController.getItems[index].name!,
                                        color: Colors.black54,
                                      ),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text:cartController.getItems[index].price.toString(),
                                            color: Colors.redAccent,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                              top: Dimensions.getHeight(10),
                                              bottom: Dimensions.getHeight(10),
                                              left: Dimensions.getWidth(10),
                                              right: Dimensions.getWidth(10),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    Dimensions.getHeight(20),
                                                  ),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    //  popularProduct.setQuantity(false);
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.getWidth(5),
                                                ),
                                                BigText(text: "0"),
                                                SizedBox(
                                                  width: Dimensions.getWidth(5),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    //  popularProduct.setQuantity(true);
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
