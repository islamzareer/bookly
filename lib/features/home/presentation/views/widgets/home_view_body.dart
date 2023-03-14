import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'custom_listview_item.dart';
import 'featured_books_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: const [CustomAppBar(), FeaturedBooksListView()]),
    );
  }
}
