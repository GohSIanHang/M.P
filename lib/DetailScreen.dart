import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

import 'book.dart';

class DetailScreen extends StatefulWidget {
  final Book book;

  const DetailScreen({Key key, this.book}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double screenHeight, screenWidth;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(widget.book.booktitle),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
            Colors.blueGrey[50],
            Colors.blueGrey[400],
            Colors.blueGrey[600],
            Colors.blueGrey[400],
            Colors.blueGrey[50]
          ])),
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(5.5),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                    Colors.yellow[900],
                    Colors.yellow[600],
                    Colors.yellow[300]
                  ])),
                  height: screenHeight / 2.5,
                  width: screenWidth / 2,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl:
                        "http://slumberjer.com/bookdepo/bookcover/${widget.book.cover}.jpg",
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                    width: screenWidth / 1.2,
                    //height: screenHeight / 2,
                    child: Card(
                        elevation: 6,
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Table(
                                    border:
                                        TableBorder.all(color: Colors.yellow),
                                    columnWidths: {
                                      0: FlexColumnWidth(2),
                                      1: FlexColumnWidth(4),
                                    },
                                    children: [
                                      TableRow(children: [
                                        TableCell(
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              height: 30,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 5, 0),
                                              child: Text("Book Id",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ))),
                                        ),
                                        TableCell(
                                            child: Container(
                                          height: 40,
                                          child: Container(
                                              alignment: Alignment.topLeft,
                                              height: 200,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 5, 0),
                                              child: Text(
                                                widget.book.bookid,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellow[100],
                                                ),
                                              )),
                                        )),
                                      ]),
                                      TableRow(children: [
                                        TableCell(
                                          child: Container(
                                              height: 40,
                                              alignment: Alignment.topLeft,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 5, 0),
                                              child: Text("Book Title",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ))),
                                        ),
                                        TableCell(
                                            child: Container(
                                          height: 70,
                                          child: Container(
                                              alignment: Alignment.topLeft,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 5, 0),
                                              child: Text(
                                                widget.book.booktitle,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellow[100],
                                                ),
                                              )),
                                        )),
                                      ]),
                                      TableRow(children: [
                                        TableCell(
                                          
                                          child: Container(
                                              height: 40,
                                              alignment: Alignment.topLeft,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 5, 0),
                                              child: Text("Author",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ))),
                                        ),
                                        TableCell(
                                          child: Container(
                                              alignment: Alignment.topLeft,
                                              height: 40,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 5, 0),
                                              child: Text(
                                                widget.book.author,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellow[100],
                                                ),
                                              )),
                                        )
                                      ]),
                                      TableRow(children: [
                                        TableCell(
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              height: 30,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 5, 0),
                                              child: Text("Description",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ))),
                                        ),
                                        TableCell(
                                            child: Container(
                                          height: 700,
                                          child: Container(
                                              alignment: Alignment.topLeft,
                                              height: 200,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 5, 0),
                                              child: Text(
                                                widget.book.description,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellow[100],
                                                ),
                                              )),
                                        )),
                                      ]),
                                      TableRow(children: [
                                        TableCell(
                                          child: Container(
                                              height: 40,
                                              alignment: Alignment.topLeft,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 5, 0),
                                              child: Text("Price",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ))),
                                        ),
                                        TableCell(
                                          child: Container(
                                              alignment: Alignment.topLeft,
                                              height: 40,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 5, 0),
                                              child: Text(
                                                "RM " + widget.book.price,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellow[100],
                                                ),
                                              )),
                                        )
                                      ]),
                                      TableRow(children: [
                                        TableCell(
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              height: 30,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 5, 0),
                                              child: Text("Rating",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ))),
                                        ),
                                        TableCell(
                                            child: Container(
                                          height: 40,
                                          child: Container(
                                              alignment: Alignment.topLeft,
                                              height: 200,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 5, 0),
                                              child: Text(
                                                widget.book.rating,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellow[100],
                                                ),
                                              )),
                                        )),
                                      ]),
                                      TableRow(children: [
                                        TableCell(
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              height: 30,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 5, 0),
                                              child: Text("Publisher",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ))),
                                        ),
                                        TableCell(
                                            child: Container(
                                          height: 40,
                                          child: Container(
                                              alignment: Alignment.topLeft,
                                              height: 200,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 5, 0),
                                              child: Text(
                                                widget.book.publisher,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellow[100],
                                                ),
                                              )),
                                        )),
                                      ]),
                                      TableRow(children: [
                                        TableCell(
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              height: 30,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 5, 0),
                                              child: Text("Isbn",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ))),
                                        ),
                                        TableCell(
                                            child: Container(
                                          height: 40,
                                          child: Container(
                                              alignment: Alignment.topLeft,
                                              height: 200,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 5, 0),
                                              child: Text(
                                                widget.book.isbn,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellow[100],
                                                ),
                                              )),
                                        )),
                                      ]),
                                      TableRow(children: [
                                        TableCell(
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              height: 40,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 5, 5, 0),
                                              child: Text("More Books",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ))),
                                        ),
                                        TableCell(
                                            child: Column(children: <Widget>[
                                          GestureDetector(
                                            onTap: () => _launchUrlDialog(),
                                            child: Container(
                                                alignment: Alignment.centerLeft,
                                                height: 40,
                                                padding: EdgeInsets.fromLTRB(
                                                  10, 5, 5, 0),
                                                child: Text(
                                                  "Click here more book",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                   color: Colors.yellow[100],
                                                  ),
                                                )),
                                          )
                                        ])),
                                      ]),
                                    ]),
                                SizedBox(height: 20),
                              ],
                            )))),
                SizedBox(height: 30),
              ],
            ),
          ),
        ));
  }

_launchUrlDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          title: new Text(
            "Open browser ?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "Yes",
                style: TextStyle(
                  color: Color.fromRGBO(101, 255, 218, 50),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
                _lauchUrl('https://library.uum.edu.my/');
              },
            ),
            new FlatButton(
              child: new Text(
                "No",
                style: TextStyle(
                  color: Color.fromRGBO(101, 255, 218, 50),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }

    Future<void> _lauchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
