import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/modules/login/controllers/login_controller.dart';
import 'package:login_app/app/routes/app_pages.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final LoginController controller = Get.find();
  final RxBool _isShowing = false.obs;
  final _formKey = GlobalKey<FormState>();

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
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(height: 0.0),
                        Text(
                          'Sign in to Continue',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40.0),
                    TextFormField(
                      cursorColor: Colors.white,
                      controller: controller.usernameController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (v) {},
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.email, color: Colors.white),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.7),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15.0),
                    Obx(
                          () => TextFormField(
                        cursorColor: Colors.white,
                        controller: controller.passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: !_isShowing.value,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.white),
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock, color: Colors.white),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _isShowing.value = !_isShowing.value;
                            },
                            icon: Icon(
                              _isShowing.value ? Icons.visibility : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.7),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: 200.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                            controller.login(context);
                          }
                        },
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                            : const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.register);
                          },
                          child: const Text(
                            'Register Now',
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
