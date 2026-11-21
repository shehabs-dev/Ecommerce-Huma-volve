class UserEntity {
  int id;
  String firstName;
  String lastName;
  String maidenName;
  int? age;
  String gender;
  String email;
  String phone;
  String username;

  UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
  });
}
