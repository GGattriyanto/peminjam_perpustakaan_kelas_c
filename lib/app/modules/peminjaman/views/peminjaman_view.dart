import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_pinjam.dart';

import '../../../data/model/response_book.dart';
import '../../../routes/app_pages.dart';
import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('PeminjamanView'),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff171616),
      body: Center(
        child: controller.obx((state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (context, index){
            DataPinjam dataPinjam = state[index];
            return Card(
              color: Color(0xffD9D9D9),
              child: ListTile(
                title: Text("${dataPinjam.book?.judul}",style: TextStyle(
                  color: Colors.black,
                      fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                // subtitle: Text("Penulis ${dataPinjam.book?.penulis}\nPinjam : ${dataPinjam.tanggalPinjam}\nKembali : ${dataPinjam.tanggalKembali}",style:
                //   TextStyle(color: Colors.black),),
                trailing: Text("${dataPinjam.status}",style: TextStyle(color: Colors.black,fontSize: 15,))
              ),
            );
          },
          separatorBuilder: (context, index)=> Divider(),
        ),onLoading: Center(child: CupertinoActivityIndicator())
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
