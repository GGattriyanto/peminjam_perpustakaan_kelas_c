import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      backgroundColor: Color(0xff171616),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120),
          child: Form(
            key: controller.formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 400,
                    width: 400,
                    child: Image.asset(
                        'assets/Logo Tok Putih.png'
                    )),
                SizedBox(height: 20,),
                TextFormField(
                  controller: controller.namaController,
                  decoration: InputDecoration(hintText: "Masukkan Nama",
                  fillColor: Colors.white,
                    filled: true,
                    hintStyle: const TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(),
                    ),
                  labelText: 'Masukkan Nama'),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Nama tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(hintText: "Masukkan Username",
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Masukkan Username'),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Username tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: controller.telpController,
                  decoration: InputDecoration(hintText: "Masukkan Telepon",
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Masukkan Telepon'),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Telepon tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: controller.alamatController,
                  decoration: InputDecoration(hintText: "Masukkan Alamat",
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Masukkan Alamat'),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Alamat tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(hintText: "Masukkan Password",
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Masukkan Password'),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Password tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                Obx(
                      () => controller.loading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                      onPressed: () {
                        controller.register();
                      },
                      child: Text("Tambah"),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            primary: Color(0xffED5F5F),
                            onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            textStyle: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),),

                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
