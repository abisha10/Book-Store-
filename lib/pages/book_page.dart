import 'package:bookstore/components/my_button.dart';
import 'package:bookstore/models/store.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/models/book.dart';
import 'package:provider/provider.dart';

class BookPage extends StatefulWidget {
  final Book book;
  const BookPage({super.key, required this.book});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  //method to add to cart
  void addToCart(Book book) {
    Navigator.pop(context);
    context.read<Store>().addToCart(book);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //scaffold ui
    Scaffold(
    backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            //book image
            Padding(padding: EdgeInsets.only(top: 15)),
            SafeArea(child: Center(child: Image.asset(widget.book.imagePath, height: 300,width: 300,))),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title
                  Text(widget.book.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),



                  //author
                  Text(widget.book.author,style: TextStyle(fontSize: 20),) ,
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.redAccent,size: 22,),
                      Icon(Icons.star, color: Colors.redAccent,size: 22),
                      Icon(Icons.star, color: Colors.redAccent,size: 22),
                      Icon(Icons.star, color: Colors.redAccent,size: 22),
                      Icon(Icons.star_border_purple500, color: Colors.redAccent,size: 22),
                    ],
                  ),

                  //price
                  Text('Rs. '+ widget.book.price.toString(),style: TextStyle(fontSize: 15),),


                  SizedBox(height: 25,),
                  //about
                  Text("About the book:",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('         '+ widget.book.about,style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            // add to cart
            MyButton(text: "Add to cart",
                onTap: () => addToCart(widget.book)),
            SizedBox(height: 25),
          ],
        ),
      ),
    ),
      //back btn
      SafeArea(
        child: Container(
            child: IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              onPressed: () => Navigator.pop(context),
            ),
          ),
      ),
    ],

    );
  }
}
