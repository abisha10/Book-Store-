import 'package:flutter/material.dart';
import 'package:bookstore/models/book.dart';
class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Book book;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({super.key, required this.quantity, required this.book, required this.onDecrement, required this.onIncrement});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //decrease button
          GestureDetector(
            onTap: onDecrement,
            child: Icon(Icons.remove, size: 20,),
          ),
          //quantity
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: 20,
                child: Center(
                  child: Text(quantity.toString()),
                ),
              ),
          ),
          //Increase button
          GestureDetector(
            onTap: onIncrement,
            child: Icon(Icons.add, size: 20,),
          ),
        ],
      ),
    );
  }
}
