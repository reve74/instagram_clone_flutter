import 'package:get/get.dart';
import 'package:instagram_clone_flutter/src/controller/auth_controller.dart';
import 'package:instagram_clone_flutter/src/controller/bottom_nav_controller.dart';

class InitBinding extends Bindings { // 앱 실행 시 컨트롤러들을 인스턴스로 올려주는 클래스
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}
