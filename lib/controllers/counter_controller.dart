import 'package:get/get.dart';

class CounterController extends GetxController {
  var number = 0.obs;
  var isDark = false.obs;

  void increment() => number++;
  void decrement() => number--;
  void changeTheme() => isDark.value = !isDark.value;
}
