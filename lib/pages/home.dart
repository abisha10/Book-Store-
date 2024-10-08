import 'package:bookstore/components/my_sliver.dart';
import 'package:bookstore/components/my_tab_bar.dart';
import 'package:bookstore/models/book.dart';
import 'package:bookstore/models/store.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/components/my_drawer.dart';
import 'package:bookstore/components/my_current_location.dart';
import 'package:bookstore/components/my_description_box.dart';
import 'package:provider/provider.dart';
import 'package:bookstore/components/my_book_tile.dart';
import 'package:bookstore/pages/book_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  //tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: BookCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //sort out and return a list of book  items that belong to a specific category
  List<Book> _filterMenuByCategory(BookCategory category, List<Book> fullMenu) {
    return fullMenu.where((book) => book.category == category).toList();
  }

  //return list of books in given category
  List<Widget> getBookInThisCategory(List<Book> fullMenu) {
    return BookCategory.values.map((category) {
      //get category menu
      List<Book> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
          itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            //get individual book
            final book = categoryMenu[index];

            //return book tile UI
            return BookTile(book: book,
                onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BookPage(book: book),));
                });
          },
      );
    }).toList();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliver(
            title: MyTabBar(tabController: _tabController),   //30:00
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Colors.grey[500],
                  ),
                  //current location
                  MyCurrentLocation(),
                  //description box
                  const MyDescriptionBox(),

                ],
              ),
          ),
        ],
        body: Consumer<Store>(
          builder: (context, store, child) => TabBarView(
            controller: _tabController,
            children: getBookInThisCategory(store.menu),
          ),
        ),
      ),
    );
  }
}
