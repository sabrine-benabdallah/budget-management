import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/modules/register/controllers/register_controller.dart';

class RegistrationPage extends StatelessWidget {
  final RegistrationController controller = Get.find();

  final RxBool _isShowing = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/Login.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  TextField(
                    cursorColor: Colors.white,
                    controller: controller.emailController,
                    keyboardType: TextInputType.name,
                    onChanged: (v) {},
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Your Name',
                      labelStyle: const TextStyle(color: Colors.white),
                      border: const OutlineInputBorder(),
                      prefixIcon:
                      const Icon(Icons.perm_identity, color: Colors.white),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Obx(
                        () => TextField(
                      cursorColor: Colors.white,
                      controller: controller.passWordController,
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
                            _isShowing.value
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
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: 200.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0), // Rounded corners
                        ),
                      ),
                      onPressed: ()  {
                         controller.register();
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
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
        ],
      ),
    );
  }
}
