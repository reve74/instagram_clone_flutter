import 'package:get/get.dart';
import 'package:instagram_clone_flutter/src/models/instagram_user.dart';
import 'package:instagram_clone_flutter/src/repository/user_repository.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  Rx<IUser> user = IUser().obs;

  Future<IUser?> loginUser(String uid) async{
    // DB 조회
    var userData = UserRepository.loginUserByUid(uid);
    return userData;
  }

  void signUp(IUser signUser) async{
    var result = await UserRepository.signUp(signUser);
    if(result) {
      user(signUser);
    }
  }
}