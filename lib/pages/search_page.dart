// search_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookstore/pages/book_page.dart';
import 'package:bookstore/models/book.dart';
import 'package:bookstore/models/store.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Book> _filteredBooks = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final allBooks = Provider.of<Store>(context, listen: false).menu;
    _filteredBooks = allBooks;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text;
    final allBooks = Provider.of<Store>(context, listen: false).menu;

    if (query.isEmpty) {
      setState(() {
        _filteredBooks = allBooks;
      });
    } else {
      setState(() {
        _filteredBooks = allBooks.where((book) {
          final bookName = book.name.toLowerCase();
          final input = query.toLowerCase();
          return bookName.contains(input);
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search books...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: TextStyle(color: Colors.white, fontSize: 18),
          cursorColor: Colors.white,
        ),
        backgroundColor: theme.primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: _filteredBooks.isNotEmpty
          ? ListView.builder(
        itemCount: _filteredBooks.length,
        itemBuilder: (context, index) {
          final book = _filteredBooks[index];
          return ListTile(
            leading: Image.asset(
              book.imagePath,
              width: 50,
              height: 70,
              fit: BoxFit.cover,
            ),
            title: Text(book.name),
            subtitle: Text(book.author),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookPage(book: book),
                ),
              );
            },
          );
        },
      )
          : Center(
        child: Text(
          'No books found.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
