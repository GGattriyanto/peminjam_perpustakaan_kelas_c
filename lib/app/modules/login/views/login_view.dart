import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff171616),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
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
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                      hintText: "Masukkan Username",
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
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                      hintText: "Masukkan Password",
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
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => controller.loading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            controller.login();
                          },
                          child: Text("Login"),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              primary: Color(0xffED5F5F),
                              onPrimary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              textStyle: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                ),
                SizedBox(height: 8,),
                ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.REGISTER),
                  child: Text("Register"),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      primary: Color(0xffED5F5F),
                      onPrimary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
