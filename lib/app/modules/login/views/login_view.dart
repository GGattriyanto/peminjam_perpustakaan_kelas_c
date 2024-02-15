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
      backgroundColor: Colors.black54,
      body: Center(
        child: Form(key: controller.formkey,child: Column(
          children: [
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
              SizedBox(height: 15,),
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
              Obx(() => controller.loading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                child: Text("Login")),),
            ElevatedButton(onPressed: ()=>Get.toNamed(Routes.REGISTER),
                child: Text("Register"))
          ],
        ),),),
    );
  }
}
