class AuthModel {
  AuthModel({
    required this.email,
    required this.password,
    this.username,
  });
  String? email;
  String? password;
  String? username;

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'],
      password: json['password'],
      username: json['username'],
    );
  }
  Map<String, dynamic> toJson() {
    final data = {'email': email, 'password': password, 'username': username};
    return data;
  }
}

class UserModel {
  String? username;
  String? email;
  String? password;
  bool? isAdmin;
  List<dynamic>? followers;
  List<dynamic>? following;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  UserModel(
      {this.username,
      this.email,
      this.password,
      this.isAdmin,
      this.followers,
      this.following,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['user']['username'],
      email: json['user']['email'],
      password: json['user']["password"],
      isAdmin: json['user']["isAdmin"],
      followers: json['user']["followers"] ?? [],
      following: json['user']["following"] ?? [],
      id: json['user']["_id"],
      createdAt: json['user']["createdAt"],
      updatedAt: json['user']["updatedAt"],
      v: json['user']["__v"],
    );
  }
}

// class UserModel {
//   String? username;
//   String? email;

//   UserModel({
//     this.username,
//     this.email,
//   });

//   // factory UserModel.fromJson(Map<String, dynamic> json) {
//   //   return UserModel(
//   //     username: json['username'],
//   //     email: json['email'],
//   //   );
//   // }
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//   return UserModel(
//     username: json['user']['username'], // Make sure to access the 'username' field from the 'user' object
//     email: json['user']['email'], // Similarly, access other fields like email
//     // Other fields...
//   );
// }

// }