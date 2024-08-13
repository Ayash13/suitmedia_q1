import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/CustomButton.dart';
import '../controller/FirstScreenController.dart';
import 'SecondScreen.dart';

class FirstScreen extends StatelessWidget {
  final FirstScreenController controller = Get.put(FirstScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(157, 255, 255, 255),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_add,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(color: Colors.black54),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) => controller.name.value = value,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(color: Colors.black54),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Palindrome',
                ),
                onChanged: (value) => controller.sentence.value = value,
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                text: 'CHECK',
                onPressed: () {
                  bool isPalindrome =
                      controller.isPalindrome(controller.sentence.value);
                  Get.defaultDialog(
                    content: SizedBox(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isPalindrome ? Icons.check_circle : Icons.cancel,
                            color: isPalindrome ? Colors.green : Colors.red,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            isPalindrome ? 'Palindrome' : 'Not a palindrome',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    title: "Palindrome Check",
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'NEXT',
                onPressed: () => Get.to(SecondScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
