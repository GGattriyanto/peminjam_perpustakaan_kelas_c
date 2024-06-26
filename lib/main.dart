import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() {
  // GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "G-Library",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
