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
        backgroundColor: Colors.transparent,
        title: Text('${Get.parameters['judul']}'),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff171616),
      body: Form(
          key: controller.formkey,
          child: Container(
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
              cursorColor: Colors.white,
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
                SizedBox(height: 20),
                Obx(
                      () => controller.loading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                      onPressed: () {
                        controller.add_pinjam();
                      },
                      child: Text("Pinjam"),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            primary: Color(0xffED5F5F),
                            onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            textStyle: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))),
                ),
              ],
      ),
          ))
    );
  }
}
