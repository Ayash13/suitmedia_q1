import 'package:get/get.dart';

class FirstScreenController extends GetxController {
  var name = ''.obs;
  var sentence = ''.obs;

  bool isPalindrome(String text) {
    String cleaned = text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    return cleaned == cleaned.split('').reversed.join('');
  }
}
