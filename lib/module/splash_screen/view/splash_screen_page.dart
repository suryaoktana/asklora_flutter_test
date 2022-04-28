import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/custom_style.dart';
import '../../template/view/custom_loading_indicator.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("CRYPTO WATCH",
              style: GoogleFonts.ubuntu(
                  fontSize: CustomStyle.fontSizeJumbo,
                  fontWeight: FontWeight.w900,
                  color: CustomStyle.mainColor
              ),
            ),
            const SizedBox(height: 16,),
            const CustomLoadingIndicator()
          ],
        ),
      ),
    );
  }
}
