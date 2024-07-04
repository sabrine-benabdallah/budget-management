import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/modules/register/controllers/register_controller.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/Login.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    TextFormField(
                      controller: controller.usernameController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Your Name',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.perm_identity,
                            color: Colors.white),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Obx(
                      () => TextFormField(
                        controller: controller.passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: !controller.isPasswordVisible.value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.white),
                          border: const OutlineInputBorder(),
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.white),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.togglePasswordVisibility();
                            },
                            icon: Icon(
                              controller.isPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Obx(
                      () => SizedBox(
                        width: 200.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: controller.isLoading.value
                              ? null
                              : () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.register(context);
                                  }
                                },
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                )
                              : const Text(
                                  'Register',
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(
                            'Back to Login',
                            style: TextStyle(color: Colors.yellow),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
