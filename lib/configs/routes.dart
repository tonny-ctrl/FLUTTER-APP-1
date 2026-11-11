import 'package:flutter_application_1/views/home.dart';
import 'package:flutter_application_1/views/login.dart';
import 'package:flutter_application_1/views/signup.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

var myRoutes = [
  GetPage(name: "/", page: () => LoginScreen()),
  GetPage(name: "/registration", page: () => SignUpScreen()),
  GetPage(name: "/home", page: () => HomeScreen()),
];
