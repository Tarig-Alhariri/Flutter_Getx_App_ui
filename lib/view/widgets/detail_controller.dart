import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  var fav = 0.obs;

  void favCounter() {
    if (fav.value == 1) {
      Get.snackbar("Loved it", "You Already Loved it",
          backgroundColor: Colors.orange.withOpacity(.5));
    } else {
      Get.snackbar("Loved it ", "You Just Loved it",
          backgroundColor: Colors.orange.withOpacity(.5));
    }
  }
}
