import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_flutter/src/controller/bottom_nav_controller.dart';
import 'package:instagram_clone_flutter/src/pages/active_history.dart';
import 'package:instagram_clone_flutter/src/pages/home.dart';
import 'package:instagram_clone_flutter/src/pages/mypage.dart';
import 'package:instagram_clone_flutter/src/pages/search.dart';
import 'components/image_data.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // 첫번째 화면에서 뒤로가기 클릭 시 앱 종료 여부 설정 -> 컨트롤러로 관리
      onWillPop: controller.willPopAction,
      child: Obx(
        () => Scaffold(
          body: IndexedStack(
            // 페이지별로 화면 출력
            index: controller.pageIndex.value,
            children: [
              const Home(),
              Navigator(
                key: controller.searchPageNavigationKey,
                // Search페이지에서 bottomNavigationbar를 쓰기 위해서 키를 부여
                onGenerateRoute: (routeSetting) {
                  return MaterialPageRoute(
                    builder: (context) => Search(),
                  );
                },
              ),
              Container(),
              const ActiveHistory(),
              const MyPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.pageIndex.value,
            elevation: 0,
            onTap: controller.changeBottomNav,
            items: [
              BottomNavigationBarItem(
                  icon: ImageData(IconsPath.homeOff),
                  activeIcon: ImageData(IconsPath.homeOn),
                  label: 'home'),
              BottomNavigationBarItem(
                  icon: ImageData(IconsPath.searchOff),
                  activeIcon: ImageData(IconsPath.searchOn),
                  label: 'home'),
              BottomNavigationBarItem(
                  icon: ImageData(IconsPath.uploadIcon), label: 'home'),
              BottomNavigationBarItem(
                  icon: ImageData(IconsPath.activeOff),
                  activeIcon: ImageData(IconsPath.activeOn),
                  label: 'home'),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                label: 'home',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
