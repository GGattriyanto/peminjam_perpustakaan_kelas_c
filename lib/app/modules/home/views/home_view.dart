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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hello, Selamat Datang\nGalang",style: TextStyle(fontSize: 20,color: Colors.white)),
          ElevatedButton(onPressed: ()=>Get.toNamed(Routes.BOOK), child: Text("Buku")),
          ElevatedButton(onPressed: ()=>Get.toNamed(Routes.PEMINJAMAN), child: Text("Peminjaman")),
          Center(
            child: GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              itemCount: 4,
              itemBuilder: (ctx, i) {
                return Card(
                  child: Container(
                    height: 290,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Image.network(
                                'https://image.gambarpng.id/pngs/gambar-transparent-hard-cover-book-illustration_54542.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            // Text(
                            //   'Buku',
                            //   style: TextStyle(
                            //     fontSize: 18,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            Column(
                              children: [
                                Text(
                                  'Subtitle',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 5,
                mainAxisExtent: 264,
              ),
            ),

            // child: Column(
              //   children: [
              //     Text("Hello, Selamat Datang\nGalang",style: TextStyle(fontSize: 35,color: Colors.white)),
              //     ElevatedButton(onPressed: ()=>Get.toNamed(Routes.BOOK), child: Text("Buku")),
              //     ElevatedButton(onPressed: ()=>Get.toNamed(Routes.PEMINJAMAN), child: Text("Peminjaman")),
              //   ],
              // )
          ),
        ],
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
