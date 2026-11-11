import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daystar Application"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset("logo.jpeg", height: 100, width: 200)],
            ),
            // Add your sign-up form fields here
            SizedBox(height: 15),
            Text(
              "Enter your username",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: primaryColor,
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                hintText: "Enter your username",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Enter your email",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: primaryColor,
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Enter your email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Enter your password",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: primaryColor,
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Enter your password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 15),
            MaterialButton(
              onPressed: () {
                if (usernameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  Get.snackbar(
                    "Error",
                    "please enter username,email and password",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                  );
                  return;
                } else {
                  Get.snackbar(
                    "Sign Up Successful",
                    "The username is ${usernameController.text}, the email is ${emailController.text}, and the password is ${passwordController.text}",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.blueAccent,
                    colorText: Colors.white,
                  );
                }
                // Handle sign-up logic here
              },
              color: primaryColor,
              minWidth: double.infinity,
              height: 50,
              child: const Text(
                "Sign Up",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to the login screen
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
