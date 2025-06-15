class UserModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  UserModel({this.userId, this.id, this.title, this.body});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  @override
  String toString() {
    return "UserModel(id: $id, userId: $userId, title: $title, body: $body)";
  }
}
