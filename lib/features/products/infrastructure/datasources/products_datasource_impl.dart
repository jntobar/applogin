

import 'package:dio/dio.dart';
import 'package:teslo_shop/config/constants/environment.dart';
import 'package:teslo_shop/features/products/domain/domain.dart';
import 'package:teslo_shop/features/products/infrastructure/mappers/product_mapper.dart';

class ProductsDatasourceImpl extends ProductsDatasource{

  late final Dio dio;
  final String accessToken ;

  ProductsDatasourceImpl({required this.accessToken}):dio = Dio(BaseOptions(
    baseUrl: Environment.apiUrl,
    headers: {
      'Authorization': 'Bearer $accessToken'

    }));


  @override
  Future<Product> createUpdateProduct(Map<String, dynamic> productLike) {
    // TODO: implement createUpdateProduct
    throw UnimplementedError();
  }

  @override
  Future<Product> getProductbyId(String id) {
    // TODO: implement getProductbyId
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProductsByPage({int limit = 10, int offset = 0}) async{
    final response = await dio.get<List>('/products', queryParameters: {
      'limit': limit,
      'offset': offset,
    });   
    final List<Product> products =[];
    for (final product in response.data ?? []) {
      products.add(  ProductMapper.jsonToEntity(product)  );
    }
    return products;

  }

  @override
  Future<List<Product>> searchProductByTerm(String term) {
    // TODO: implement searchProductByTerm
    throw UnimplementedError();
  }
}