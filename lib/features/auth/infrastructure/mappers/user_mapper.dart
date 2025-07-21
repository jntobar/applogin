


import 'package:teslo_shop/features/auth/domain/domain.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
        id: json['id'] as String,
        email: json['email'] as String,
        fullName: json['fullName'] as String,        
        roles:List<String>.from(json['roles'].map((role)=> role)),
        token: json['token'],
      );
}