
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class Dimensions{
//   static double ScreenHeight = Get.context!.height;
//   static double ScreenWidth = Get.context!.width;
//   static double pageViewContainer = ScreenHeight/3.44; //884(instructor's screen heigt)/220
//   static double pageViewTextContainer = ScreenHeight/6.31; //884(instructor's screen heigt)/120
//   static double pageView = ScreenHeight/2.37;
//   static double  height10 = ScreenHeight/75.8;
//    static double  height20 = ScreenHeight/37.9;
//     static double  height15 = ScreenHeight/50.53;
//     static double font20 = ScreenHeight/37.9;
// }

class Dimensions{
  static double screenHeight = Get.context?.height ?? 812.0; // fallback to iPhone X height
  static double screenWidth = Get.context?.width ?? 375.0;   // fallback to iPhone X width

  static double baseHeight = 758.0;
  static double baseWidth = 360.0;

  /// Scale height based on design height
  static double getHeight(double inputHeight) {
    double value = (inputHeight / baseHeight) * screenHeight;
    return value < 0 ? 0 : value; // Prevent negative padding
  }

  /// Scale width based on design width
  static double getWidth(double inputWidth) {
    double value = (inputWidth / baseWidth) * screenWidth;
    return value < 0 ? 0 : value;
  }

  /// Optional: Call this early to initialize screen size
  static void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }
}
