import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomToast(String title, String message,
    {int durationInSeconds = 2}) {
  Get.snackbar(
    title,
    message,
    margin: const EdgeInsets.only(top: 60, bottom: 10, right: 10, left: 10),
    borderRadius: 8,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    backgroundColor: Colors.white,
    colorText: Colors.black,
    snackPosition: SnackPosition.TOP,
    boxShadows: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 5,
        spreadRadius: 1,
      ),
    ],
    duration: Duration(seconds: durationInSeconds),
  );
}
