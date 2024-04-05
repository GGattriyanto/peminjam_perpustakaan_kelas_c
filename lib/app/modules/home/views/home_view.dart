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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, Selamat Datang\nGalang",style: TextStyle(fontSize: 20,color: Colors.white)),
            SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 400,
                    height: 20,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: 'Cari...',
            //     prefixIcon: Icon(Icons.search),
            //   ),
            // ),

            SizedBox(height: 20,),
            Text("Rekomendasi",style: TextStyle(fontSize: 20,color: Colors.white)),

            // ElevatedButton(onPressed: ()=>Get.toNamed(Routes.BOOK), child: Text("Buku")),
            // ElevatedButton(onPressed: ()=>Get.toNamed(Routes.PEMINJAMAN), child: Text("Peminjaman")),
            SizedBox(height: 5,),
            Container(
              height: 250,
              width: 1000,
              color: Colors.white,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                itemCount: 7,
                itemBuilder: (ctx, i) {
                  return Card(
                    child: InkWell(
                      onTap:  (){
                        Get.toNamed(Routes.BOOK);
                      },
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
                                  child: Image.asset(
                                    'laskar-pelangi.jpg',
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
                                SizedBox(height: 8,),
                                Column(
                                  children: [
                                    Text(
                                      'Laskar Pelangi',
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
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 264,
                ),
              ),
            ),
          SizedBox(height: 25,),
            Text("Trending",style: TextStyle(fontSize: 20,color: Colors.white)),
            SizedBox(height: 10,),
            Container(
              height: 250,
              width: 1000,
              color: Colors.white,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                itemCount: 7,
                itemBuilder: (ctx, i) {
                  return Card(
                    child: InkWell(
                      onTap:  (){
                        Get.toNamed(Routes.DETAIL_BOOK);
                      },
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
                                  child: Image.asset(
                                    'laskar-pelangi.jpg',
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
                                SizedBox(height: 8,),
                                Column(
                                  children: [
                                    Text(
                                      'Laskar Pelangi',
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
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 264,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: SizedBox(
                width: 400,
                height: 60,
                child: ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.BOOK),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.book, color: Colors.white, size: 30),
                      SizedBox(width: 10),
                      Text("Book", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      primary: Color(0xffED5F5F),
                      onPrimary: Colors.white,
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(height: 10)
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



