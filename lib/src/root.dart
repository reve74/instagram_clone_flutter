import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_flutter/src/app.dart';
import 'package:instagram_clone_flutter/src/controller/auth_controller.dart';
import 'package:instagram_clone_flutter/src/models/instagram_user.dart';
import 'package:instagram_clone_flutter/src/pages/login.dart';

import 'pages/signup_page.dart';

class Root extends GetView<AuthController> {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AuthController authController = Get.put(AuthController());
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext _, AsyncSnapshot<User?> user) {
          if (user.hasData) {
            //TODO: 내부 파이어베이스 유저 정보를 조회 with user.data.uid
            return FutureBuilder<IUser?>(
              future: controller.loginUser(user.data!.uid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const App();
                } else {
                  return Obx(() => controller.user.value.uid != null
                      ? const App()
                      : SignupPage(uid: user.data!.uid));
                }
                return const App();
              },
            );
            return const App();
          } else {
            return Login();
          }
          return Container();
        });
  }
}
