import 'package:asklora_flutter_test/module/token/controller/token_controller.dart';
import 'package:asklora_flutter_test/module/token/view/component/token_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../const/custom_style.dart';
import '../../../template/view/template_form.dart';

class TokenSearch extends GetView<TokenController> {
  TokenSearch({Key? key}) : super(key: key){
    controller.initiateSearchResult();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.fromLTRB(CustomStyle.horizontalMargin-12, 0, CustomStyle.horizontalMargin-12, 24),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 42),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: GestureDetector(
                      onTap:()=>Get.back(),
                      child: Icon(Icons.chevron_left, size: 36, color: CustomStyle.fontColorGrey,)),
                  padding: EdgeInsets.only(bottom: 12),),
                SizedBox(width: 8,),
                Expanded(child: TemplateForm(
                  onChanged: controller.searchToken,
                  prefixIcon: Icon(Icons.search_rounded),
                  color: Colors.black,
                  fillColor: Colors.grey[200],
                  borderColor: Colors.transparent,
                  hintText: "What token are you searching for?",
                  radius: 6,))
              ],
            ),
          ),
          Expanded(child: SingleChildScrollView(child: TokenList("Search - USD", searchQueries: true,)))
        ],
      ),
    );
  }
}
