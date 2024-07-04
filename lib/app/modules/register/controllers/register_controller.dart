import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/app/modules/home/views/home_view.dart';

class RegistrationController extends GetxController {
  var emailController = TextEditingController();
  var passWordController = TextEditingController();

  var message = ''.obs;
  @override
  void onInit()async  {
    // TODO: implement onInit
    super.onInit();
   await  register();
  }

  Future<void> register() async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/api/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': emailController.text,
          'password': passWordController.text,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        message.value = 'Registration successful';
        Get.to(() => HomeView());
      } else {
        message.value = 'Registration failed';
      }
    } catch (e) {
      message.value = 'Failed to connect to the server. Please try again later.';
    }
  }
}
