import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/item_model.dart';

class ItemController extends GetxController {
  var isLoading = true.obs;
  var postList = <Item>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      print('Fetching posts...');
      var response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: {
          'Accept': 'application/json',
          'User-Agent': 'FlutterApp'
        },
      );
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        postList.value = data.map((e) => Item.fromJson(e)).toList();
      } else {
        print('Failed to fetch data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
      isLoading(false);
  }

}
