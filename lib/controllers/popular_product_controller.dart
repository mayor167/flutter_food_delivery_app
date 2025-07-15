import 'package:app1/data/repository/popular_product_repo.dart';
import 'package:app1/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
    final PopularProductRepo  popularProductRepo;
     PopularProductController({required this.popularProductRepo});
     List<ProductModel> _popularProductList=[ ];
     List <ProductModel> get popularProductLsit => _popularProductList;
     bool _isLoaded = false;
     bool get isLoaded =>_isLoaded;
     Future<void>getPopularProductList()async {
        Response response= await popularProductRepo.getPopularProductList();
        if(response.statusCode==200){
          print("Got products");
          _popularProductList=[];
         _popularProductList.addAll(Product.fromJson(response.body).products);
       //  print(_popularProductList);
       _isLoaded = true;
          update();
        }else{ 
          
        }
     }
}