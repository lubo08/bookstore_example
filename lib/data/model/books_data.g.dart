// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksData _$BooksDataFromJson(Map<String, dynamic> json) => BooksData(
      total: json['total'] as String,
      books: (json['books'] as List<dynamic>)
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as String?,
    );

Map<String, dynamic> _$BooksDataToJson(BooksData instance) => <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'books': instance.books,
    };
