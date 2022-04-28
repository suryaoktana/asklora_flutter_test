import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/custom_style.dart';

class DataUnavailable extends StatelessWidget {
  final Widget? optionalWidgetBottom;
  DataUnavailable({Key? key, this.optionalWidgetBottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/no_data.png', width: 46,),
          SizedBox(height: 8,),
          Text("Data Unavailable", style: GoogleFonts.ubuntu(
              fontSize: CustomStyle.fontSizeNormal-1,
              fontWeight: FontWeight.w700,
              color: CustomStyle.mainColor
          )),
          optionalWidgetBottom??Container()
        ],
      ),
    );
  }
}
