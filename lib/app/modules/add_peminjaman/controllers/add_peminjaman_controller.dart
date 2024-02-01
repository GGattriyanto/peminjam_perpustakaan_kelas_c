import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_login.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';
import 'package:dio/dio.dart' as dio;

class AddPeminjamanController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController useridController = TextEditingController();
  final TextEditingController bookidController = TextEditingController();
  final TextEditingController tglPinjamController = TextEditingController();
  final TextEditingController tglKembaliController = TextEditingController();
  final loading = false.obs;
  //TODO: Implement AddPeminjamanController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  add_pinjam() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      if (formkey.currentState!.validate()) {
        final response =
        await ApiProvider.instance().post(Endpoint.pinjam, data: {
          "tanggal_pinjam": tglPinjamController.text.toString(),
          "tanggal_kembali": tglKembaliController.text.toString(),
          "user_id": int.parse(StorageProvider.read(StorageKey.idUser)),
          "book_id": int.parse(Get.parameters['id'].toString())
        });
        if (response.statusCode == 201) {
          Get.back();
        } else {
          Get.snackbar("Sorry", "Data Gagal diinput",
              backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on DioException catch (e) {
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

}
