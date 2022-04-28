import 'package:get/get.dart';

import '../module/token/controller/token_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TokenController());
  }
}
