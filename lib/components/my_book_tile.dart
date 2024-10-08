import 'package:flutter/material.dart';
import 'package:bookstore/models/book.dart';
class BookTile extends StatelessWidget {
  final Book book;
  final void Function()? onTap;

  const BookTile({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                    //text book details
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(book.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                        Text('Rs. ' + book.price.toString(),style: TextStyle(fontSize: 16)),
                        SizedBox(height: 10,),
                        Text('Author: ' + book.author,style: TextStyle(fontSize: 16)),
                      ],
                    ),
                ),
                
                //book image
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(book.imagePath, height: 120,)
                ),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey, endIndent: 30, indent: 30, )
      ],
    );
  }
}
