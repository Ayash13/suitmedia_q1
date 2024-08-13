import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/CustomButton.dart';
import '../controller/FirstScreenController.dart';
import '../controller/SecondScreenController.dart';
import 'ThirdScreen.dart';

class SecondScreen extends StatelessWidget {
  final FirstScreenController firstScreenController = Get.find();
  final SecondScreenController secondScreenController =
      Get.put(SecondScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff554bf0)),
        title: Text(
          'Second Screen',
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
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Obx(
                        () => Text(
                          firstScreenController.name.value,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Obx(
                () => Text(
                  secondScreenController.selectedUserName.value.isEmpty
                      ? 'Selected User Name'
                      : secondScreenController.selectedUserName.value,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  text: "Choose a User",
                  onPressed: () => Get.to(ThirdScreen()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
