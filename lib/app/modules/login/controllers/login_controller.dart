import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/app/modules/home/views/home_view.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString message = ''.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  Future<void> login(BuildContext context) async {
    try {
      isLoading.value = true;
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8080/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': usernameController.text,
          'password': passwordController.text,
        }),
      );

      log("Received response: ${response.statusCode}");
      log(response.body);

      if (response.statusCode == 200) {
        message.value = 'Login successful';
        // Reset form if it exists
        formKey.currentState?.reset();

        // Clear text fields
        usernameController.clear();
        passwordController.clear();

        // Navigate to HomeView if the context is available
        Get.to(() => HomeView());
      } else {
        message.value = 'Invalid username or password';
        Get.closeCurrentSnackbar();
        Get.snackbar(
          "Login Failed",
          "Invalid username or password. Please try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      message.value =
          'Failed to connect to the server. Please try again later. $e';
      log('Error: $e');
    } finally {
      isLoading.value = false;
      FocusScope.of(context).unfocus();
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
