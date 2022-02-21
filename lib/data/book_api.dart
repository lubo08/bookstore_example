import 'package:bookstore/data/model/books_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'book_api.g.dart';

@RestApi(baseUrl: "https://api.itbook.store/1.0")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/new")
  Future<BooksData> getNewBooks();

  @GET("/search/{query}/{page}")
  Future<BooksData> searchBooks(
      @Path("query") String query, @Path("page") String page);
}
