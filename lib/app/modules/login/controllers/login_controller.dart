import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_login.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';
import 'package:dio/dio.dart' as dio;

class LoginController extends GetxController {
  var obscureText = true.obs;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loading = false.obs;


  void toggleObscureText() {
    obscureText.value = !obscureText.value; // gunakan value untuk mengubah status obscureText
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    String status = StorageProvider.read(StorageKey.status);
    log("status : $status");
    if (status == 'logged'){
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    passwordController.dispose();
    super.onClose();
  }

  login() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      if (formkey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: dio.FormData.fromMap({
              "username": usernameController.text.toString(),
              "password": passwordController.text.toString()
            }));
        if (response.statusCode == 200) {
          final ResponseLogin responseLogin = ResponseLogin.fromJson(response.data);
          await StorageProvider.write(StorageKey.status, "logged");
          await StorageProvider.write(StorageKey.idUser, responseLogin.data!.id!.toString());
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }

  void toggleObscure() {}
}
