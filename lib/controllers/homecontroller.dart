import 'package:get/get.dart';

class HomeController extends GetxController {
  var activeIndex = 0.obs;

  void updateActiveIndex(int index) {
    activeIndex.value = index;
  }
}
