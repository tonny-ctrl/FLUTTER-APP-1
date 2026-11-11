import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get.dart';

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daystar Application"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset("logo.jpeg", height: 100, width: 200)],
            ),
            SizedBox(height: 25),
            Text(
              "Enter username",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Enter email or phone number",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
              ),
            ),
            SizedBox(height: 25),
            Text(
              "Enter password",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter your password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
              ),
            ),
            SizedBox(height: 25),
            MaterialButton(
              onPressed: () {
                if (usernameController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  Get.snackbar(
                    "Error!",
                    "Please enter both your username and password",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: primaryColor,
                    colorText: Colors.white,
                  );
                  return;
                } else {
                  Get.offAndToNamed("/home");
                  Get.snackbar(
                    "Login Successful!",
                    "The username is ${usernameController.text} and the password is ${passwordController.text}",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: primaryColor,
                    colorText: Colors.white,
                  );
                }
              },
              color: primaryColor,
              height: 50,
              minWidth: double.infinity,
              child: const Text("Login"),
            ),
            Row(
              children: [
                Text("No Account?"),
                SizedBox(width: 5),
                GestureDetector(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  onTap: () {
                    Get.toNamed("/registration");
                  },
                ),
                Spacer(),
                Text("Forgot password?"),
                SizedBox(width: 5),
                Text(
                  "Recover",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
