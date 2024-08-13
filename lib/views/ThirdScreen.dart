import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/SecondScreenController.dart';
import '../controller/ThirdScreenController.dart';

class ThirdScreen extends StatelessWidget {
  final ThirdScreenController controller = Get.put(ThirdScreenController());
  final SecondScreenController secondScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff554bf0)),
        title: Text(
          'Third Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          child: Divider(
            thickness: 0.5,
            height: 0,
          ),
          preferredSize: const Size.fromHeight(10.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Obx(() {
          if (controller.isLoading.value && controller.users.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.users.isEmpty) {
            return Center(child: Text('No users available'));
          } else {
            return RefreshIndicator(
              onRefresh: () async => controller.refreshUsers(),
              child: ListView.builder(
                controller: controller.scrollController,
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  final user = controller.users[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            user.avatar,
                          ),
                        ),
                        title: Text(
                          '${user.firstName} ${user.lastName}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(user.email),
                        onTap: () {
                          secondScreenController.selectedUserName.value =
                              '${user.firstName} ${user.lastName}';
                          Get.back();
                        },
                      ),
                      Divider(
                        thickness: 0.5,
                      ),
                    ],
                  );
                },
              ),
            );
          }
        }),
      ),
    );
  }
}
