import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
          height: 36,
          width: 36,
          child: CircularProgressIndicator(strokeWidth: 6,)
      ),
    );
  }
}
