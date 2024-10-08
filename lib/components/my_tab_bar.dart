import 'package:bookstore/models/book.dart';
import 'package:flutter/material.dart';
class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return BookCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        isScrollable: true,
        controller: tabController,
        tabs: _buildCategoryTabs(),
      ),
    );
  }
}
