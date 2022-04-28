import 'package:asklora_flutter_test/module/template/view/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../const/custom_style.dart';
import '../../../template/view/custom_data_unavailable.dart';
import '../../controller/token_controller.dart';
import 'token_card.dart';

class TokenList extends GetView<TokenController> {
  final String title;
  final bool onlyFavoriteData;
  final bool searchQueries;
  TokenList(this.title,{Key? key, this.onlyFavoriteData=false, this.searchQueries=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: CustomStyle.horizontalMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 22),
            child: Text(title,
              style: GoogleFonts.ubuntu(
                  fontSize: CustomStyle.fontSizeSubTitle,
                  fontWeight: FontWeight.w800,
                  color: CustomStyle.mainColor
              ),
            ),
          ),
          Obx((){
            if(controller.isLoading.value){
              return const CustomLoadingIndicator();
            }
            else if(onlyFavoriteData&&controller.favoriteLength.value==0){
              return DataUnavailable(optionalWidgetBottom: Container(
                margin: EdgeInsets.only(top: 4),
                child: Text("Mark a token as favorite to reveal item in this page!", style: TextStyle(fontSize: CustomStyle.fontSizeSmall-2, color: Colors.grey[600], fontWeight: FontWeight.w300),),
              ),);
            }
            else if(searchQueries){
              if(controller.searchTokenDataList.length>0){
                return Column(
                  children: controller.searchTokenDataList.map((item){
                    return TokenCard(item);
                  }).toList(),
                );
              }
              else{
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: DataUnavailable(optionalWidgetBottom: Container(
                    width: MediaQuery.of(context).size.width/2,
                    margin: EdgeInsets.only(top: 4),
                    child: Text("We can't find what you are searching for, try with different keyword!", style: TextStyle(fontSize: CustomStyle.fontSizeSmall-2, color: Colors.grey[600], fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                  ),),
                );
              }
            }
            else{
              return Column(
                children: controller.tokenDataList.map((item){
                  if(onlyFavoriteData&&item.favorite||!onlyFavoriteData){
                    return TokenCard(item);
                  }
                  else{
                    return Container();
                  }
                }).toList(),
              );
            }
          }),
        ],
      ),
    );
  }
}
