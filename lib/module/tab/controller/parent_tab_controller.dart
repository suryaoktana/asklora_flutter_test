import 'package:get/get.dart';

class ParentTabController extends GetxController {
  var index = 0.obs;

  setIndex(var _index){
    index = _index;
  }
}