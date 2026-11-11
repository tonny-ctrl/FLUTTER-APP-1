import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/routes.dart';
import 'package:flutter_application_1/views/login.dart';
import 'package:flutter_application_1/views/signup.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const DaystarApplication());
}

class DaystarApplication extends StatelessWidget {
  const DaystarApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daystar Application',
      home: LoginScreen(),
      initialRoute: "/",
      getPages: myRoutes,
    );
  }
}
