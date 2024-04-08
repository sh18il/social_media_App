class AuthModel {
  AuthModel({
    required this.email,
    required this.password,
    required this.userName,
  });
  String email;
  String password;
  String userName;

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
        email: json['email'],
        password: json['password'], 
        userName: json['username']);
  }
  Map<String, dynamic> toJson() {
    final data = {'email': email, 'password': password, 'username': userName};

    return data;
  }
}

class Message {
  Message({
    required this.username,
    required this.email,
    required this.password,
    required this.isAdmin,
    required this.followers,
    required this.following,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String username;
  late final String email;
  late final String password;
  late final bool isAdmin;
  late final List<dynamic> followers;
  late final List<dynamic> following;
  late final String id;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  Message.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
    isAdmin = json['isAdmin'];
    followers = List.castFrom<dynamic, dynamic>(json['followers']);
    following = List.castFrom<dynamic, dynamic>(json['following']);
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['isAdmin'] = isAdmin;
    data['followers'] = followers;
    data['following'] = following;
    data['_id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = V;
    return data;
  }
}
