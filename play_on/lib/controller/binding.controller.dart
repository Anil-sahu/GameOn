import 'package:get/get.dart';
import 'package:play_on/controller/mathes.controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<Matches>(Matches());
  }
}
