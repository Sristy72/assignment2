import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/item_controller.dart';



class ItemScreen extends StatelessWidget {
  final ItemController itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts'), backgroundColor: Color(0xffb5b4ac)),
      body: Obx(() {
        if (itemController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: itemController.postList.length,
          itemBuilder: (context, index) {
            final post = itemController.postList[index];
            return Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Card(
                elevation: 5,
                child: ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
