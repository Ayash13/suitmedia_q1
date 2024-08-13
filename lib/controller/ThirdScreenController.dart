import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/UserModel.dart';

class ThirdScreenController extends GetxController {
  var users = <UserModel>[].obs;
  var isLoading = true.obs;
  var page = 1.obs;
  var scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();

    scrollController.addListener(() {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels != 0) {
        loadMoreUsers();
      }
    });
  }

  void fetchUsers() async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse(
          'https://reqres.in/api/users?page=${page.value}&per_page=10'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body)['data'];
        users.addAll(
            data.map<UserModel>((json) => UserModel.fromJson(json)).toList());
      }
    } finally {
      isLoading(false);
    }
  }

  void loadMoreUsers() {
    page++;
    fetchUsers();
  }

  void refreshUsers() {
    page.value = 1;
    users.clear();
    fetchUsers();
  }
}
