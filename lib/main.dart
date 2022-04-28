import 'package:asklora_flutter_test/module/splash_screen/view/splash_screen_page.dart';
import 'package:asklora_flutter_test/module/tab/binding/parent_tab_binding.dart';
import 'package:asklora_flutter_test/module/tab/view/parent_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/initial_binding.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      title: 'Cryptocurrency Market Watch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/parent_tab', page: () => ParentTab(), binding: ParentTabBinding()),
        GetPage(name: '/splash_screen', page: () => const SplashScreenPage()),
      ],
      initialRoute: '/splash_screen',
    );
  }
}
