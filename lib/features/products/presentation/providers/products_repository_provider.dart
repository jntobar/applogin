

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/auth/presentation/providers/auth_provider.dart';
import 'package:teslo_shop/features/products/domain/repositories/products_repository.dart';
import 'package:teslo_shop/features/products/infrastructure/infrastructure.dart';
import 'package:teslo_shop/features/products/infrastructure/repositories/products_repository_impl.dart';

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  final accessToken = ref.watch(authProvider).user?.token??'';
  final productRepository = ProductsRepositoryImpl(
    ProductsDatasourceImpl(accessToken:accessToken )
    );

  return productRepository ;
});