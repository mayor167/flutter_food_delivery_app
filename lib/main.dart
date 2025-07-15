import 'package:app1/controllers/popular_product_controller.dart';
import 'package:app1/controllers/recommended_product_controller.dart';
import 'package:app1/pages/food/popular_food_detail.dart';
import 'package:app1/pages/food/recommended_food_detail.dart';
import 'package:app1/pages/home/food_page_body.dart';
import 'package:app1/pages/home/main_food_page.dart';
import 'package:app1/pages/home/main_food_page_dark_mode.dart';
import 'package:app1/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  Get.config(
    enableLog: true,
    logWriterCallback: (text, {bool isError = false}) {
      debugPrint('GETX: $text');
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     Get.find<PopularProductController>().getPopularProductList();
     Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
