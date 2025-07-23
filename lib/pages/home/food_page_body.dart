import 'package:app1/controllers/popular_product_controller.dart';
import 'package:app1/controllers/recommended_product_controller.dart';
import 'package:app1/models/products_model.dart';
import 'package:app1/pages/food/popular_food_detail.dart';
import 'package:app1/routes/route_helper.dart';
import 'package:app1/utilis/app_constants.dart';
import 'package:app1/utilis/colors.dart';
import 'package:app1/utilis/dimensions.dart';
import 'package:app1/widgets/app_column.dart';
import 'package:app1/widgets/big_text.dart';
import 'package:app1/widgets/icon_and_text_widget.dart';
import 'package:app1/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.getHeight(220);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        // print("Current value is "+ _currentPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    //save memory to avoid memory linkage
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //slider section
      children: [
       
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return popularProducts.isLoaded?Container(
          // color: Colors.red,
          // height: Dimensions.pageView,
          height: Dimensions.getHeight(320),
        
            child: PageView.builder(
              controller: pageController,
              itemCount:popularProducts.popularProductLsit.length ,
              itemBuilder: (context, position) {
                return _buildPageItem(position, popularProducts.popularProductLsit[position]);
              },
            ),
          
        ):CircularProgressIndicator(color: AppColors.mainColor,);
        }),
        //dots
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return  DotsIndicator(
          dotsCount: popularProducts.popularProductLsit.isEmpty?1:popularProducts.popularProductLsit.length,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        );
        }),

        //Popular text
        SizedBox(height: Dimensions.getHeight(30)),
        Container(
          margin: EdgeInsets.only(left: Dimensions.getWidth(30)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(width: Dimensions.getWidth(10)),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.getHeight(3)),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.getWidth(10)),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.getHeight(2)),
                child: SmallText(text: "Food pairing"),
              ),
            ],
          ),
        ),
        //Recommended food
        //list of food and images
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded?ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: recommendedProduct.recommendedProductLsit.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Get.toNamed(RouteHelper.getRecommendedFood(index));
              },
              child: Container(
                margin: EdgeInsets.only(
                  left: Dimensions.getWidth(20),
                  right: Dimensions.getWidth(20),
                  bottom: Dimensions.getHeight(10),
                ),
                child: Row(
                  children: [
                    //Image section
                    Container(
                      width: Dimensions.getWidth(120),
                      height: Dimensions.getHeight(120),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimensions.getHeight(20),
                        ),
                        color: Colors.white38,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                           image: NetworkImage(recommendedProduct.recommendedProductLsit[index].img!),
                        ),
                      ),
                    ),
                    //text Container
                    Expanded(
                      child: Container(
                        height: Dimensions.getHeight(100),
                        // width: Dimensions.getWidth(200),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.getHeight(20)),
                            bottomRight: Radius.circular(
                              Dimensions.getHeight(20),
                            ),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: Dimensions.getWidth(8),
                            right: Dimensions.getWidth(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text:recommendedProduct.recommendedProductLsit[index].name!),
                              SizedBox(height: Dimensions.getHeight(10)),
                              SmallText(text: "With Chinese charactistics"),
                              SizedBox(height: Dimensions.getHeight(10)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(
                                    icon: Icons.circle_sharp,
                                    text: "Normal",
                                    iconColor: AppColors.iconColor1,
                                  ),
                                  IconAndTextWidget(
                                    icon: Icons.location_on,
                                    text: "1.7km",
                                    iconColor: AppColors.mainColor,
                                  ),
                                  IconAndTextWidget(
                                    icon: Icons.access_time_rounded,
                                    text: "32min",
                                    iconColor: AppColors.iconColor2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ):CircularProgressIndicator(color: AppColors.mainColor ,);
        })
      ],
    );
  }

  //function/widget to build the items within the Container above
  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap:(){
               
              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: Dimensions.getHeight(220),
              margin: EdgeInsets.only(
                left: Dimensions.getWidth(10),
                right: Dimensions.getWidth(10),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.getHeight(30)),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                  image: NetworkImage(popularProduct.img!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // SizedBox(height: 500,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.getHeight(120),
              margin: EdgeInsets.only(
                left: Dimensions.getWidth(27),
                right: Dimensions.getWidth(27),
                bottom: Dimensions.getHeight(30),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.getHeight(20)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.getHeight(15),
                  left: 15,
                  right: 15,
                ),
                child:AppColumn(text: popularProduct.name!,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
