import 'package:bookstore/data/book_api.dart';
import 'package:bookstore/data/model/book.dart';
import 'package:bookstore/data/model/books_data.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class BookService {
  final _bookClient =
      RestClient(Dio(BaseOptions(contentType: "application/json")));
  final BehaviorSubject<List<Book>> _books = BehaviorSubject<List<Book>>();
  final int _page = 1;

  getNewBooks() async {
    BooksData response = await _bookClient.getNewBooks();
    _books.sink.add(response.books);
  }

  searchBooks(String query) async {
    BooksData response = await _bookClient.searchBooks(query, _page.toString());
    _books.sink.add(response.books);
  }

  dispose() {
    _books.close();
  }

  BehaviorSubject<List<Book>> get books => _books;
}

final bookServiceBloc = BookService();
