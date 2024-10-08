import 'package:flutter/material.dart';
import 'package:bookstore/pages/cart_page.dart';
import 'package:bookstore/pages/search_page.dart';
class MySliver extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySliver({
    super.key,
    required this .child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 360,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        Row(
          children: [
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  const SearchPage(),
              ),
              );
            },
              icon: const Icon(Icons.search),
            ),
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage(),
              ),
              );
            },
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        )
      ],
      backgroundColor: Colors.grey[300],

      title:  Text(
        'Book Store',
        style: TextStyle(
          fontSize: 25,            // Set the font size
          fontWeight: FontWeight.bold,  // Set the font weight
          color: Colors.black,       // Set the text color
          //fontStyle: FontStyle.italic,  // Italicize the text
          letterSpacing: 2.0,       // Set letter spacing
          shadows: [
            Shadow(                 // Add a shadow to the text
              blurRadius: 10.0,
              color: Colors.black.withOpacity(0.5),
              offset: Offset(5.0, 5.0),
            ),
          ],
        ),
      ),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding( //20.00
          padding: const EdgeInsets.only(bottom: 75.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.only(left: 0,right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
