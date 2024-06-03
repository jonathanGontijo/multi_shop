import 'package:flutter/material.dart';
import 'package:multi_shop/views/screens/inner_screens/order_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return OrderScreen();
            }));
          },
          child: Text('My Orders')),
    ));
  }
}
