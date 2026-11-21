import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  new({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.maidenName,
    super.age,
    required super.gender,
    required super.email,
    required super.phone,
    required super.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      maidenName: json['maidenName'],
      age: json['age'],
      gender: json['gender'],
      email: json['email'],
      phone: json['phone'],
      username: json['username'],
    );
  }
}
