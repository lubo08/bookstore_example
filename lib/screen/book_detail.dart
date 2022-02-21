import 'dart:ui';
import 'package:bookstore/constants/Theme.dart';
import 'package:bookstore/data/model/book.dart';
import 'package:bookstore/widget/navbar.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Book book = ModalRoute.of(context)?.settings.arguments as Book;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: Navbar(
          title: 'Book detail',
          transparent: false,
          backButton: true,
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 80),
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: NetworkImage(book.image),
                      fit: BoxFit.cover)),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.blueGrey.withOpacity(0.1),
                    Colors.black.withOpacity(0.95),
                  ])),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.50,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(book.title,
                        style:
                            const TextStyle(fontSize: 28, color: Colors.white)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: MaterialColors.label),
                                child: Text(book.price,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16))),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: const Icon(Icons.shopping_cart,
                                color: MaterialColors.priceColor),
                          ),
                          const Text("Shop now",
                              style:
                                  TextStyle(color: MaterialColors.priceColor))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 8,
                            blurRadius: 10,
                            offset: const Offset(0, 0))
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: const Radius.circular(13.0),
                        topRight: const Radius.circular(13.0),
                      )),
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.58,
                  ),
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                flex:
                                    2, // <-- Flex takes care of the remaining space ratio
                                child: Text(book.subtitle))
                          ],
                        ),
                        // PhotoAlbum(imgArray: imgArray)
                      ],
                    ),
                  )),
            )
          ],
        ));
  }
}
