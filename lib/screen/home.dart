import 'dart:async';

import 'package:bookstore/data/book_api.dart';
import 'package:bookstore/data/model/book.dart';
import 'package:bookstore/data/model/books_data.dart';
import 'package:bookstore/service/book_service.dart';
import 'package:bookstore/widget/book_item.dart';
import 'package:bookstore/widget/card-horizontal.dart';
import 'package:bookstore/widget/navbar.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer? _debounce;
  late ScrollController controller;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: Navbar(
          title: "title".tr(),
          searchBar: true,
          searchOnChanged: _onSearchChanged,
        ),
        body: _buildBody(context));
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        bookServiceBloc.searchBooks(query);
      } else {
        bookServiceBloc.getNewBooks();
      }
    });
  }

  // build list view & manage states
  StreamBuilder<List<Book>> _buildBody(BuildContext context) {
    bookServiceBloc.getNewBooks();
    controller = ScrollController()..addListener(_scrollListener);
    return StreamBuilder<List<Book>>(
      stream: bookServiceBloc.books.stream,
      builder: (context, snapshot) {
        final List<Book>? books = snapshot.data;
        if (books != null && books.isNotEmpty) {
          return _buildListView(context, books);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // build list view & its tile
  Widget _buildListView(BuildContext context, List<Book> books) {
    return ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(left: 15, right: 15),
        controller: controller,
        children: List.generate(
            books.length, (index) => BookItem(book: books[index])));
  }

  void _scrollListener() {
    // print(controller.position.extentAfter);
    if (controller.position.extentAfter < 500) {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        print('call next page');
      });
    }
  }
}
