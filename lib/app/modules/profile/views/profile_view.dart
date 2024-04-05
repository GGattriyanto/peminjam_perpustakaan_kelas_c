import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/modules/home/views/home_view.dart';
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 100,
              backgroundImage: AssetImage('assets/Logo Tok.png'),
            ),
            Text(
              'Galang',
              style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            ListTile(
              title: Text('Edit Profile'),
              textColor: Colors.white,
              leading: Icon(Icons.person,color: Colors.white,),
              onTap: () {
                // Get.back();
                Get.toNamed(Routes.HOME);
              },
            ),
            Divider(color: Colors.white),
            ListTile(
              title: Text('Log out'),
              textColor: Colors.white,
              leading: Icon(Icons.logout,color: Colors.white,),
              onTap: () {
                // Get.back();
                Get.toNamed(Routes.LOGIN);
              },
            ),
            Divider(color: Colors.white),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amberAccent,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => Get.toNamed(Routes.HOME),
                icon: Icon(Icons.home)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () => Get.toNamed(Routes.PEMINJAMAN),
                  icon: Icon(Icons.bookmark)),
              label: 'Koleksi'),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () => Get.toNamed(Routes.PROFILE),
                  icon: Icon(Icons.person)),
              label: 'profile'),
        ],
      ),
    );
  }
}
