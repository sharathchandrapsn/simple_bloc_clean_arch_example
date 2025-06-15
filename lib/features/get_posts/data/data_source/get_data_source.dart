import 'dart:convert';

import 'package:simple_bloc_clean_arch_example/core/network/dio_client.dart';

import '../models/user_model.dart';
import 'package:http/http.dart';

class GetDataSource {
  DioClient dioClient;
  GetDataSource(this.dioClient);
  Future<List<UserModel>> fetchPosts() async {
    var response = await dioClient.get("/posts");
    // var response =
    //     await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      // final decoded = json.decode(response.data);
      final decoded = response.data as List;
      return decoded.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load posts");
    }
  }

  Future<UserModel> addPost(UserModel userModel) async {
    var response =
        await dioClient.put("/posts/${userModel.id}", userModel.toJson());
    // var response =
    //     await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      // final decoded = json.decode(response.data);
      // final decoded = response.data as List;
      // return decoded.map((e) => UserModel.fromJson(e)).toList();
      return UserModel.fromJson(response.data);
    } else {
      throw Exception("Failed to load posts");
    }
  }
}
