import 'package:asklora_flutter_test/module/tab/controller/parent_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/custom_style.dart';
import 'component/token_search.dart';

class Header extends GetView<ParentTabController> {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(CustomStyle.horizontalMargin,CustomStyle.topMarginPage,CustomStyle.horizontalMargin,0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text("Crypto Watch",
                    style: GoogleFonts.ubuntu(
                        fontSize: CustomStyle.fontSizeTitle,
                        fontWeight: FontWeight.w800,
                        color: CustomStyle.mainColor
                    ),
                  )
              ),
              GestureDetector(
                  onTap: ()=>controller.index.value=1,//GOING TO FAVORITE PAGES
                  child: const Icon(Icons.star_border, color: Colors.black, size: 26,)),
              const SizedBox(width: 10,),
              GestureDetector(
                  onTap: ()=>Get.bottomSheet(
                    TokenSearch(),
                    backgroundColor: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    isScrollControlled: true,
                    enableDrag: false
                  ),
                  child: const Icon(Icons.search, color: Colors.black, size: 26,)),
            ],
          ),
          const Divider(thickness: 1, height: 36,),
        ],
      ),
    );
  }
}
