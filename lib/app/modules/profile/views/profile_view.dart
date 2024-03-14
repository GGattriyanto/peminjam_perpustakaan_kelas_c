import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff171616),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 100,
              backgroundImage: AssetImage('assets/Logo Tok.png'),
            ),
            Text(
              'Galang',
              style: TextStyle(fontSize: 45,color: Colors.white,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40,),
            ListTile(
              textColor: Colors.white,
              title: Text('Edit Profile',style: TextStyle(color: Colors.white),),
              tileColor: Colors.transparent,
              leading: Icon(Icons.person,color: Colors.white,),
            ),
          ],
        ),
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