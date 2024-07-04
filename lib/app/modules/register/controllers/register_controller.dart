import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/app/modules/home/views/home_view.dart';

class RegisterController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  RxBool isLoading = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxString message = ''.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> register(BuildContext context) async {
    try {
      isLoading.value = true;
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8080/api/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': usernameController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode < 400) {
        message.value = 'Registration successful';
        Get.to(() => HomeView());
        formKey.currentState!.reset();
      } else {
        message.value = 'Registration failed';
      }
    } catch (e) {
      message.value =
          'Failed to connect to the server. Please try again later.';
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
