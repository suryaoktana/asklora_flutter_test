import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/custom_style.dart';
import '../../token/view/token_list_favorite_page.dart';
import '../../token/view/token_list_page.dart';
import '../controller/parent_tab_controller.dart';

class ParentTab extends GetView<ParentTabController> with WidgetsBindingObserver {
  ParentTab({Key? key}) : super(key: key);

  final List<Widget> _listPage = <Widget>[
    TokenListPage(),
    const TokenListFavoritePage()
  ];

  final List<BottomNavigationBarItem> bottomNavigationBarItem =
  <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.list, color: CustomStyle.tabButtonColor, size: 28,),
        activeIcon: Icon(Icons.list, color: CustomStyle.mainColor, size: 28,),
        label: "All Token"),
    BottomNavigationBarItem(
        icon: Icon(Icons.star_border, color: CustomStyle.tabButtonColor, size: 28,),
        activeIcon: Icon(Icons.star_border, color: CustomStyle.mainColor, size: 28,),
        label: "Favorite"),
  ];

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Obx(() => Scaffold(
        body: Center(
          child: _listPage[controller.index.value],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: bottomNavigationBarItem,
          currentIndex: controller.index.value,
          selectedItemColor: CustomStyle.mainColor,
          unselectedItemColor: Colors.grey,
          onTap: (value)=>controller.index.value = value,
        ),
      )),
    );
  }

  Future<bool> _onWillPop() async {
    return (await Get.defaultDialog(
        titlePadding: const EdgeInsets.only(top: 16),
        contentPadding: const EdgeInsets.all(16),
        title: 'Exit App',
        content: const Text('Are you sure you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => exit(0),
            child: const Text('Ok'),
          ),
        ]
    )) ??
        false;
  }
}
