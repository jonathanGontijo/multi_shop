import 'package:flutter/material.dart';
import 'package:multi_shop/views/screens/nav_screens/widgets/banner_widget.dart';
import 'package:multi_shop/views/screens/nav_screens/widgets/category_item.dart';
import 'package:multi_shop/views/screens/nav_screens/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          HeaderWidgets(),
          BannerWidget(),
          CategoryItem(),
        ],
      ),
    ));
  }
}
