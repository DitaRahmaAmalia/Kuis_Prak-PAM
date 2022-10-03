import 'package:flutter/material.dart';
import 'package:untitled2/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final BooksData buku;

  const DetailPage({Key? key, required this.buku}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (isFavorite) ? Colors.lightBlueAccent : Colors.white,
      appBar: AppBar(
        title: Text("${widget.buku.id}"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: (isFavorite)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: (MediaQuery
                .of(context)
                .size
                .height) / 3,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount : 2) ,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Image.network(widget.buku.imageLinks[index]),
                );
              },
              itemCount: widget.buku.imageLinks.length,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textBesar(widget.buku.title),
                SizedBox(height: 10,),
                Container(
                  height: 35,
                  // child: GridView.builder(
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount : 2) ,
                  //   shrinkWrap: true,
                  //   scrollDirection: Axis.horizontal,
                  //   // itemCount: int.parse(widget.buku.stars),
                  //   // itemBuilder: (BuildContext context, int index) =>
                  //   //     Icon(Icons.stars),
                  // ),
                ),
                textBesar(widget.buku.title),
                // SizedBox(height: 10,),
                // textBesar("Authors : " + widget.buku.authors),
                SizedBox(height: 10,),
                textBesar("Publisher : " + widget.buku.publisher),
                SizedBox(height: 10,),
                textBesar("Published Date : " + widget.buku.publishedDate),
                SizedBox(height: 10,),
                textBesar("Description : " + widget.buku.description),
                SizedBox(height: 10,),
                // textBesar("Categories : " + widget.buku.categories),
                // SizedBox(height: 10,),
                textBesar("Link Pemesanan : "),
                SizedBox(height: 10,),
      //           SizedBox(
      //             height: (MediaQuery.of(context).size.height)/10,
      //             width: (MediaQuery.of(context).size.width),
      //             child: GridView.builder(
      //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: widget.buku.facility.length,
      //               ),
      //               itemBuilder: (context,index){
      //           child: Text("Preview");
      //           Container(
      //             child: ElevatedButton(
      //               onPressed: () {
      //                 _launchURL(widget.buku.previewLink);
      //               },
      //               child: Text("Preview"),
      //             ),
      //         ),
      //     )
        ],
      ),
    ),

    ],
    ),
    );
  }

  Widget textBesar(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20),
    );
  }

  Widget textSedang(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16),
    );
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

}