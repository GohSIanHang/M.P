import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:midterm_262333/book.dart';
import 'package:midterm_262333/DetailScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List bookdata;
  double screenHeight, screenWidth;

  @override
  void initState() {
    super.initState();
    _loadData();
    // loadPref();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    if (bookdata == null) {
      return Scaffold(
          appBar: AppBar(
            title: Text('List of Books'),
          ),
          body: Container(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Loading Book List",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )
              ],
            ),
          )));
    } else {
      return WillPopScope(
          onWillPop: _onBackPressed,
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'List of Books',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                        child: GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio:
                                (screenWidth / screenHeight) / 0.8,
                            children: List.generate(bookdata.length, (index) {
                              return Container(
                                  child: Card(
                                      elevation: 10,
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () => _onBookDetail(index),
                                              child: Container(
                                                height: screenHeight / 3.9,
                                                width: screenWidth / 3.9,
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.scaleDown,
                                                  imageUrl:
                                                      "http://slumberjer.com/bookdepo/bookcover/${bookdata[index]['cover']}.jpg",
                                                  placeholder: (context, url) =>
                                                      new CircularProgressIndicator(),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          new Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                            
                                            Text(bookdata[index]['booktitle'],
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                            Text(
                                                "Price: RM " +
                                                    bookdata[index]['price'],
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      )));
                            })))
                  ],
                ),
              )));
    }
  }

  _onBookDetail(int index) async {
    print(bookdata[index]['booktitle']);
    Book book = new Book(
        bookid: bookdata[index]['bookid'],
        booktitle: bookdata[index]['booktitle'],
        author: bookdata[index]['author'],
        price: bookdata[index]['price'],
        description: bookdata[index]['description'],
        rating: bookdata[index]['rating'],
        publisher: bookdata[index]['publisher'],
        isbn: bookdata[index]['isbn'],
        cover: bookdata[index]['cover']);

    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>DetailScreen(
                  book: book,
                )));
    _loadData();
  }

  void _loadData() {
    String urlLoadJobs = "http://slumberjer.com/bookdepo/php/load_books.php";
    http.post(urlLoadJobs, body: {}).then((res) {
      setState(() {
        var extractdata = json.decode(res.body);
        bookdata = extractdata["books"];
      });
    }).catchError((err) {
      print(err);
    });
  }

  Future<bool> _onBackPressed() {
    // savepref(true);
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title: new Text(
              'Are you sure?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
            content: new Text(
              'Do you want to exit',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                  onPressed: () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                  child: Text(
                    "Exit",
                    style: TextStyle(
                      color: Color.fromRGBO(101, 255, 218, 50),
                    ),
                  )),
              MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Color.fromRGBO(101, 255, 218, 50),
                    ),
                  )),
            ],
          ),
        ) ??
        false;
  }
}
