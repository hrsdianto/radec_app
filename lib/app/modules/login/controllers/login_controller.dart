import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  TextEditingController emailC =
      TextEditingController(text: "hrsdianto@gmail.com");
  TextEditingController passC = TextEditingController(text: "123456");
  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
