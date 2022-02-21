import 'package:json_annotation/json_annotation.dart';
part 'book.g.dart';

@JsonSerializable()
class Book {
  String title;
  String subtitle;
  String isbn13;
  String price;
  String image;
  String url;

  Book({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}
