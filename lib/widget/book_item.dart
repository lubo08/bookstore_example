import 'dart:math';
import 'package:bookstore/constants/Theme.dart';
import 'package:bookstore/data/model/book.dart';
import 'package:bookstore/widget/avatar_image.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  BookItem({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  Widget build(BuildContext context) {
    double _width = 80, _height = 110;
    return GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/book', arguments: book);
        },
        child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Stack(children: [
                  Container(
                      padding: const EdgeInsets.only(bottom: 50, right: 40),
                      width: _width,
                      height: _height,
                      decoration: BoxDecoration(
                        color: MaterialColors.primary,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: MaterialColors.shadowColor.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(
                                1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Container(
                        width: _width / 2,
                        height: _height / 2,
                        decoration: BoxDecoration(
                            color: Color(Random().nextInt(0xffffffff))
                                .withAlpha(0xff),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15))),
                      )),
                  Container(
                    width: _width,
                    height: _height,
                    padding: const EdgeInsets.all(6),
                    child: AvatarImage(
                      book.image,
                      isSVG: false,
                      radius: 8,
                    ),
                  )
                ]),
                const SizedBox(
                  width: 18,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(book.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 12,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: book.price,
                          style: const TextStyle(
                              fontSize: 16,
                              color: MaterialColors.primary,
                              fontWeight: FontWeight.w500)),
                    ]))
                  ],
                ))
              ],
            )));
  }
}
