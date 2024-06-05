import 'package:flutter/material.dart';
import 'package:multi_shop/views/screens/nav_screens/widgets/banner_widget.dart';
import 'package:multi_shop/views/screens/nav_screens/widgets/category_item.dart';
import 'package:multi_shop/views/screens/nav_screens/widgets/header_widget.dart';
import 'package:multi_shop/views/screens/nav_screens/widgets/recommended_product_widget.dart';
import 'package:multi_shop/views/screens/nav_screens/widgets/reuseable_text_widget.dart';

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
          ReusableTextWidget(
              title: 'Recommended for you', subtitle: 'View all'),
          RecommendedProductWidget(),
          ReusableTextWidget(title: 'Popular Products', subtitle: 'View all'),
        ],
      ),
    ));
  }
}
