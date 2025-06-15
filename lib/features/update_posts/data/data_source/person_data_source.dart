import 'dart:convert';

import 'package:http/http.dart';
import 'package:simple_bloc_clean_arch_example/core/network/dio_client.dart';
import 'package:simple_bloc_clean_arch_example/features/update_posts/data/models/person_model.dart';

class PersonDataSource {
  DioClient dioClient;
  PersonDataSource(this.dioClient);
  Future<List<PersonModel>> fetchPersons() async {
    var response = await dioClient.get("/users");
    // var response =
    //     await get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      // List decoded = json.decode(response.data);
      final decoded = response.data as List;
      return decoded.map((e) => PersonModel.fromJson(e)).toList();
    } else {
      throw Exception("failed to load person data");
    }
  }
}
