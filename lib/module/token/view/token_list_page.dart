import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../template/view/custom_loading_indicator.dart';
import '../controller/token_controller.dart';
import 'component/token_list.dart';
import 'header.dart';

class TokenListPage extends GetView<TokenController> {
  const TokenListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        if(controller.isLoading.value){
          return const CustomLoadingIndicator();
        }
        else{
          return content();
        }
      }),
    );
  }

  Widget content(){
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            TokenList("All Token - USD"),
          ],
        ),
      ),
    );
  }
}
