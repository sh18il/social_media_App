class UserrModel {
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

  UserrModel(
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

  factory UserrModel.fromJson(Map<String, dynamic> json) {
    return UserrModel(
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
