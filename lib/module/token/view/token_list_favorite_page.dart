import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/custom_style.dart';
import '../../template/view/custom_loading_indicator.dart';
import '../controller/token_controller.dart';
import 'component/token_list.dart';

class TokenListFavoritePage extends GetView<TokenController> {
  const TokenListFavoritePage({Key? key}) : super(key: key);

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
      child: Container(
        margin: EdgeInsets.only(top: CustomStyle.topMarginPage+2),
        child: SingleChildScrollView(
          child: TokenList("Favorite Token - USD", onlyFavoriteData: true,),
        ),
      ),
    );
  }
}
