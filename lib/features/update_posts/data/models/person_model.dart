class PersonModel {
  int? id;
  String? name;
  String? username;
  String? email;

  PersonModel({this.id, this.name, this.username, this.email});

  PersonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map['id'] = id;
    map['name'] = name;
    map['username'] = username;
    map['email'] = email;
    return map;
  }

  @override
  String toString() {
    return "PersonModel(id: $id, name: $name, username: $username, email: $email)";
  }
}
