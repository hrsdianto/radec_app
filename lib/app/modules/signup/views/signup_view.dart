import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:radec_app/app/controllers/auth_controller.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(context),
            _inputFields(context),
            _loginInfo(context),
          ],
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Text(
          "Create Account",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Enter details to get started",
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  _inputFields(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: controller.unameC,
          decoration: InputDecoration(
            hintText: "Username",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: controller.emailC,
          decoration: InputDecoration(
            hintText: "Email id",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.email_outlined),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: controller.passC,
          decoration: InputDecoration(
            hintText: "Password",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.password_outlined),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: controller.levelC,
          decoration: InputDecoration(
            hintText: "Status",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.password_outlined),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () => authC.signup(
            controller.unameC.text,
            controller.emailC.text,
            controller.passC.text,
            controller.levelC.text,
          ),
          child: Text(
            "Sign Up",
            style: TextStyle(fontSize: 15),
          ),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 12),
          ),
        )
      ],
    );
  }

  _loginInfo(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?"),
        TextButton(onPressed: () => Get.back(), child: Text("Login"))
      ],
    );
  }
}
