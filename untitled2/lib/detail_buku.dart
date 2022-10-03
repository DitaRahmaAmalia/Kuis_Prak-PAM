import 'package:flutter/material.dart';
import 'package:untitled2/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailBuku extends StatefulWidget {
  final BooksData buku;

  const DetailBuku({Key? key, required this.buku}) : super(key: key);

  @override
  _DetailBukuState createState() => _DetailBukuState();
}

class _DetailBukuState extends State<DetailBuku> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (isFavorite) ? Colors.lightBlueAccent : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: Text("${widget.buku.title}"),
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Image.network(
                  widget.buku.imageLinks,
                  width: 192,
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.blueGrey),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                child: Column(
                  children: [
                    Text(
                      "${widget.buku.title}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "${widget.buku.description}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.buku.publishedDate}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                          child: VerticalDivider(
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          "${widget.buku.categories}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Card(
              //   color: Colors.black12,
              //   child: Padding(
              //     padding: const EdgeInsets.all(12.0),
              //     child: Row(
              //       children: [
              //         Container(
              //           width: 23,
              //           child: Text("#",
              //               textAlign: TextAlign.center,
              //               style: TextStyle(fontSize: 12, color: Colors.white)),
              //         ),
              //         SizedBox(
              //           height: 25,
              //           child: VerticalDivider(
              //             color: Colors.white54,
              //           ),
              //         ),
              //         Text("Title",
              //             style: TextStyle(fontSize: 12, color: Colors.white))
              //       ],
              //     ),
              //   ),
              // ),
              // Expanded(
              //   child: ListView.builder(
              //       itemBuilder: (context, index) {
              //         return Card(
              //           child: Padding(
              //             padding: const EdgeInsets.all(12.0),
              //             child: Row(
              //               children: [
              //                 Container(
              //                   width: 23,
              //                   child: Text(
              //                     "${index + 1}",
              //                     textAlign: TextAlign.center,
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   height: 25,
              //                   child: VerticalDivider(
              //                     color: Colors.black54,
              //                   ),
              //                 ),
              //                 Text(widget.album.songs[index])
              //               ],
              //             ),
              //           ),
              //         );
              //       },
              //       itemCount: widget.buku.songs.length),
              // ),
            ],
          ),
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