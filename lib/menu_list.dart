import 'package:flutter/material.dart';
import 'package:untitled2/data_buku.dart';

import 'detail_buku.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Tempat Wisata"),
      ),

      body: GridView.builder(
      final BooksData buku = bukuList[index];
      return Card(
        child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
          return DetailPage(buku: buku);
          }));
      },
      child: Container(
        height: (MediaQuery.of(context).size.height)/4,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.network(wisata.imageUrl[0], fit: BoxFit.cover, width: MediaQuery.of(context).size.width, color: Colors.black45, colorBlendMode: BlendMode.darken,),
          ],
          // padding: EdgeInsets.all(8),
          // height: (MediaQuery.of(context).size.height)/4,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.srcOver),
          //     fit: BoxFit.cover,
          //     image: NetworkImage(hotel.imageUrl[0])
          //   )
          // ),
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     textAlignLeftWhite(hotel.name),
          //     Container(
          //       height: 35,
          //       child: ListView.builder(
          //         shrinkWrap: true,
          //         scrollDirection: Axis.horizontal,
          //         itemCount: int.parse(hotel.stars),
          //         itemBuilder: (BuildContext context, int index) => Icon(Icons.star, color: Colors.white,),
          //       ),
          //     ),
          //     textAlignLeftWhite(hotel.roomPrice)
          //   ],
          // ),
        ),
      ),
    ),
    );
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount : 2) ,
        itemBuilder: (_, index) => FlutterLogo(),
        itemCount: 4,
      ),
    );
  }
}

Widget textAlignLeftWhite(String text){
  return Text(
    text,
    textAlign: TextAlign.left,
    style: TextStyle(
      color: Colors.white,
      fontSize: 30,
    ),
  );
}