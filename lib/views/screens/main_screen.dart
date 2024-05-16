import 'package:flutter/material.dart';
import 'package:multi_shop/views/screens/nav_screens/account_screen.dart';
import 'package:multi_shop/views/screens/nav_screens/cart_screen.dart';
import 'package:multi_shop/views/screens/nav_screens/favorite_screen.dart';
import 'package:multi_shop/views/screens/nav_screens/home_screen.dart';
import 'package:multi_shop/views/screens/nav_screens/stores_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    const StoresScreen(),
    const CartScreen(),
    const AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text('Main Screen'),
      // ),
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          currentIndex: _pageIndex,
          onTap: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/home.png', width: 25),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/love.png', width: 25),
                label: 'Favorite'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/mart.png', width: 25),
                label: 'Stores'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/cart.png', width: 25),
                label: 'Cart'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/user.jpeg', width: 25),
                label: 'Account'),
          ]),
    );
  }
}
