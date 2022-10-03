import 'package:flutter/material.dart';
import 'package:untitled2/data_buku.dart';

import 'detail_buku.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Buku"),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemBuilder: (context, index) {
            final BooksData buku = booksData[index];
            return Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return DetailBuku(buku: buku);
                    }),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Image.network(
                        buku.imageLinks,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.all(12.0),
                    //   child: Column(
                    //     children: [
                    //       Text(
                    //         album.albumName,
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(fontSize: 18),
                    //       ),
                    //       Text(
                    //         album.singer,
                    //         style: TextStyle(fontSize: 12),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            );
          },
          itemCount: booksData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
        ),
      ),
    );
  }
}