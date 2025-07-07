import 'package:app1/utilis/colors.dart';
import 'package:app1/utilis/dimensions.dart';
import 'package:app1/widgets/big_text.dart';
import 'package:app1/widgets/icon_and_text_widget.dart';
import 'package:app1/widgets/small_text.dart';
import 'package:flutter/material.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                    BigText(text: text, size: Dimensions.getHeight(26),),
                    SizedBox(height: Dimensions.getHeight(10)),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 15,
                            ),
                          ),
                        ),
                        SizedBox(width: Dimensions.getWidth(10)),
                        SmallText(text: "4.5"),
                        SizedBox(width: Dimensions.getWidth(10)),
                        SmallText(text: "1287"),
                        SizedBox(width: Dimensions.getWidth(10)),
                        SmallText(text: "comments"),
                      ],
                    ),
                    SizedBox(height: Dimensions.getHeight(20)),
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
              );
  }
}