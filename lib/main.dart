import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:multi_shop/controllers/category_controller.dart';
import 'package:multi_shop/views/screens/authentication_screens/login_screen.dart';
import 'package:multi_shop/views/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyBtUQIA9WbtgfTsGn1vjynMnlPVE24lkJ4",
            appId: "1:173120249003:android:89bab1ebeab8bebedbabee",
            messagingSenderId: "173120249003",
            projectId: "multi-store-77e7d",
            storageBucket: "gs://multi-store-77e7d.appspot.com",
          ),
        )
      : await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
      initialBinding: BindingsBuilder(
        () {
          Get.put<CategoryController>(CategoryController());
        },
      ),
    );
  }
}
