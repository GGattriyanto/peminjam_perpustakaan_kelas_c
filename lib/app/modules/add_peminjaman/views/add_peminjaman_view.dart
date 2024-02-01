import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Get.parameters['judul']}'),
        centerTitle: true,
      ),
      body: Form(
          key: controller.formkey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.tglPinjamController,
                decoration: InputDecoration(hintText: "Masukkan Tanggal"),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Tanggal tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.tglKembaliController,
                decoration: InputDecoration(hintText: "Masukkan Tanggal"),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Tanggal tidak boleh kosong";
                  }
                  return null;
                },
              ),
              Obx(
                    () => controller.loading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                    onPressed: () {
                      controller.add_pinjam();
                    },
                    child: Text("Pinjam")),
              )
            ],
      ))
    );
  }
}
