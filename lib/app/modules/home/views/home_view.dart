import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff171616),
      body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: ()=>Get.toNamed(Routes.BOOK), child: Text("Buku")),
              ElevatedButton(onPressed: ()=>Get.toNamed(Routes.PEMINJAMAN), child: Text("Peminjaman")),
            ],
          )
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amberAccent,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(onPressed: () => Get.toNamed(Routes.HOME),icon: Icon(Icons.home)),
              label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: IconButton(onPressed: () => Get.toNamed(Routes.PEMINJAMAN),icon: Icon(Icons.bookmark)),
              label: 'Koleksi'
          ),
          BottomNavigationBarItem(
              icon: IconButton(onPressed: () => Get.toNamed(Routes.PROFILE), icon: Icon(Icons.person)),
              label: 'profile'
          ),
        ],
      ),
    );
  }
}
