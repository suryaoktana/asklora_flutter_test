import 'package:asklora_flutter_test/const/token_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../const/custom_style.dart';
import '../../controller/token_controller.dart';

class TokenCard extends GetView<TokenController> {
  final TokenModel tokenModel;
  TokenCard(this.tokenModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(tokenModel.imageAssetPath, width: 34,),
              const SizedBox(width: 18,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(tokenModel.name,
                                style: TextStyle(
                                    fontSize: CustomStyle.fontSizeNormal,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black
                                ),
                              ),
                              Container(
                                  padding: const EdgeInsets.only(top: 2, left: 6),
                                  child: Icon(Icons.circle, color: tokenModel.isSubscribed?Colors.green:Colors.redAccent, size: 6,)),
                              tokenModel.favorite?Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  child: const Icon(Icons.star, color: Colors.yellow, size: 20,)):Container(),
                            ],
                          ),
                          const SizedBox(height: 2,),
                          Text("Last sync : ${tokenModel.lastSynced!=null?tokenModel.timeAgo():'-'}", style: TextStyle(fontSize: CustomStyle.fontSizeSmall-4)),
                        ],
                      ), 
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Tooltip(
                                  padding: const EdgeInsets.fromLTRB(6,4,6,4),
                                  textStyle: GoogleFonts.ubuntu(fontSize: CustomStyle.fontSizeSmall-2, color: Colors.white),
                                  message: "Open Price",
                                  height: 18,
                                  verticalOffset: 24,
                                  triggerMode: TooltipTriggerMode.tap,
                                  child: Text("\$ ${tokenModel.openPrice.toStringAsFixed(CustomStyle.decimalPlaces)}",
                                    style: TextStyle(
                                        fontSize: CustomStyle.fontSizeNormal-1,
                                        fontWeight: FontWeight.w600,
                                        color: CustomStyle.mainColor
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4,),
                                Tooltip(
                                  padding: const EdgeInsets.fromLTRB(6,4,6,4),
                                  textStyle: GoogleFonts.ubuntu(fontSize: CustomStyle.fontSizeSmall-2, color: Colors.white),
                                  message: "Trade Volume",
                                  height: 18,
                                  verticalOffset: 24,
                                  triggerMode: TooltipTriggerMode.tap,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.info, color: Colors.grey[350], size: 12,),
                                      const SizedBox(width: 3,),
                                      Text("${tokenModel.volume.toStringAsFixed(CustomStyle.decimalPlaces)} \$",
                                        style: TextStyle(
                                            fontSize: CustomStyle.fontSizeSmall-3,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.green
                                        ),
                                      ),


                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8,),
                          PopupMenuButton<String>(
                            onSelected: onSelected,
                            itemBuilder: (BuildContext context) {
                              return actionMenu(favorite: tokenModel.favorite);
                            },
                            child: Icon(Icons.more_vert_rounded, color: Colors.grey[600], size: 22,)
                          )
                          ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
          const Divider(thickness: 0.8, height: 40,)
        ],
      ),
    );
  }

  actionMenu({bool favorite=false}){
    List<String> buttonAksi;
    buttonAksi = [!favorite?'Mark as Favorite':'Unmark as Favorite'];
    return buttonAksi.map((String choice) {
      return PopupMenuItem<String>(
        value: choice,
        child: Text(choice),
      );
    }).toList();
  }

  void onSelected(String value){
    if(value=='Mark as Favorite'){
      controller.markAsFavorite(tokenModel.pair);
    }
    else{
      controller.unmarkAsFavorite(tokenModel.pair);
    }
  }
}
