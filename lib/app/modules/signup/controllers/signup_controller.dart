import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignupController extends GetxController {
  TextEditingController unameC = TextEditingController(text: "Haris");
  TextEditingController emailC =
      TextEditingController(text: "hrsdianto@gmail.com");
  TextEditingController passC = TextEditingController(text: "123456");
  TextEditingController levelC = TextEditingController(text: "Guru");

  @override
  void onClose() {
    unameC.dispose();
    emailC.dispose();
    passC.dispose();
    levelC.dispose();
    super.onClose();
  }
}
