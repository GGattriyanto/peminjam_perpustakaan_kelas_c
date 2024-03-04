import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../data/model/response_book.dart';
import '../../../routes/app_pages.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('BookView'),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff171616),
      body: controller.obx((state) => ListView.separated(
        itemCount: state!.length,
        itemBuilder: (context, index){
          DataBook dataBook = state[index];
          return ListTile(
            title: Text("${dataBook.judul}",style: TextStyle(color: Colors.white),),
            subtitle: Text("Penulis ${dataBook.penulis}\n${dataBook.penerbit} - ${dataBook.tahunTerbit}",
              style: TextStyle(color: Colors.white),),
            trailing: ElevatedButton(onPressed: ()=> Get.toNamed(Routes.ADD_PEMINJAMAN,parameters: {
              'id' : (dataBook.id ??0).toString(),'judul' : dataBook.judul ??'-'
            }),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    primary: Color(0xffED5F5F),
                    onPrimary: Colors.white),
              child: Text("Pinjam", style: TextStyle(color: Colors.white) ,)),
          );
        },
        separatorBuilder: (context, index)=> Divider(),
      ),onLoading: Center(child: CupertinoActivityIndicator())
      )
    );
  }
}
