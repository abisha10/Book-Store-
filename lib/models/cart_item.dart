import 'package:bookstore/models/book.dart';

class CartItem{
  Book book;
  int quantity;

  CartItem({
    required this.book, this.quantity = 1,
  });
  double get totalPrice {
    return (book.price) * quantity;
  }
}