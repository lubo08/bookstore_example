import 'package:bookstore/data/model/book.dart';
import 'package:json_annotation/json_annotation.dart';
part 'books_data.g.dart';

@JsonSerializable()
class BooksData {
  String total;
  String? page;
  List<Book> books;

  BooksData({required this.total, required this.books, this.page});

  factory BooksData.fromJson(Map<String, dynamic> json) =>
      _$BooksDataFromJson(json);
  Map<String, dynamic> toJson() => _$BooksDataToJson(this);
}
