import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/app/modules/home/views/home_view.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var message = ''.obs;

  Future<void> login(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8080/api/login'), // Use appropriate URL based on your setup
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': emailController.text,
          'password': passWordController.text,
        }),
      );
      log("Received response: ${response.statusCode}");
      log(response.body);

      if (response.statusCode == 200) {
        message.value = 'Login successful';

        // Clear the form fields
        emailController.clear();
        passWordController.clear();

        Get.to(() => HomeView());
      } else {
        message.value = 'Invalid username or password';
        FocusScope.of(context).unfocus();
        Get.closeCurrentSnackbar();
        Get.snackbar(
          "Login Failed",
          "This account does not exist. Please register.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      message.value = 'Failed to connect to the server. Please try again later.';
      FocusScope.of(context).unfocus();
      print("Error: $e");
    }
  }
}
