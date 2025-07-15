
import 'package:app1/data/repository/recommended_product_repo.dart';
import 'package:app1/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
    final RecommendedProductRepo  recommendedProductRepo;
     RecommendedProductController({required this.recommendedProductRepo});
     List<ProductModel> _recommendedProductList=[ ];
     List <ProductModel> get recommendedProductLsit => _recommendedProductList;
     bool _isLoaded = false;
     bool get isLoaded =>_isLoaded;
     Future<void>getRecommendedProductList()async {
        Response response= await recommendedProductRepo.getRecommendedProductList();
        if(response.statusCode==200){
          print("Got products recommended");
          _recommendedProductList=[];
         _recommendedProductList.addAll(Product.fromJson(response.body).products);
       //  print(_popularProductList);
       _isLoaded = true;
          update();
        }else{ 
          print("Could not get products recommended");
        }
     }
}