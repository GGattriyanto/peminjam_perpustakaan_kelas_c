import 'package:date_time_picker/date_time_picker.dart';
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
            DateTimePicker(
            controller: controller.tglPinjamController,
            dateMask: 'yyyy-MM-dd',
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            dateLabelText: 'Date',
            onChanged: (val) => print(val),
              validator: (value) {
                if (value!.length < 2) {
                  return "Judul tidak boleh kosong";
                }
                return null;
              },
            onSaved: (val) => print(val),
          ),
              DateTimePicker(
            controller: controller.tglKembaliController,
            dateMask: 'yyyy-MM-dd',
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            dateLabelText: 'Date',
            onChanged: (val) => print(val),
            validator: (val) {
              print(val);
              return null;
            },
            onSaved: (val) => print(val),
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
