import 'package:get/get.dart';

import '../controller/parent_tab_controller.dart';

class ParentTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ParentTabController());
  }
}
