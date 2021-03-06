import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_flutter/src/components/message_popup.dart';
import 'package:instagram_clone_flutter/src/controller/upload_controller.dart';
import 'package:instagram_clone_flutter/src/pages/upload.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE } // 페이지별로 화면 처리

class BottomNavController extends GetxController {
  static BottomNavController get to => Get.find();

  RxInt pageIndex = 0.obs; // TODO: obs ?
  GlobalKey<NavigatorState> searchPageNavigationKey = GlobalKey<
      NavigatorState>(); // Search페이지에서 bottomNavigationbar를 쓰기 위해서 키를 부여
  List<int> bottomHistory = [0]; // 페이지 히스토리를 관리하는 리스트

  void changeBottomNav(int value, {bool hasGesture = true}) {
    // =>app 쪽 Scaffold를 obx로 감싸줘야함
    var page = PageName.values[value];

    switch (page) {
      case PageName.UPLOAD: // 업로드는 페이지 전환이 아닌 화면위에 그려짐
        Get.to(() => Upload(), binding: BindingsBuilder(() {
          Get.put(UploadController());
        }));
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    // 화면 전환을 위한 메서드
    pageIndex(value);

    if (!hasGesture) return;

    // if(bottomHistory.contains(value)) {
    //   bottomHistory.remove(value);
    // }
    // bottomHistory.add(value); // 페이지 히스토리를 관리하는 리스트에 더함
    // print(bottomHistory);

    if (bottomHistory.last != value) {
      // 페이지 히스토리의 마지막에 밸류값이 없으면 리스트에 더함
      bottomHistory.add(value);
      print(bottomHistory);
    }
  }

  Future<bool> willPopAction() async {
    // 첫번째 화면에서 뒤로가기 클릭 시 앱 종료 여부 설정
    if (bottomHistory.length == 1) {
      showDialog(
        context: Get.context!,
        builder: (context) => MessagePopUp(
          message: '종료하시겠습니까',
          title: '시스템',
          okCallback: () {
            exit(0);
          },
          cancelCallback: () {
            print('빽');
            Get.back();
          },
        ),
      );
      return true;
    } else {
      var page = PageName.values[bottomHistory.last];
      if (page == PageName.SEARCH) {
        var value = await searchPageNavigationKey.currentState!.maybePop();
        if (value) return false;
      }

      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      print(bottomHistory);
      return false;
    }
  }
}
