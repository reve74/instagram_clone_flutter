import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_flutter/src/components/avatar_widget.dart';
import 'package:instagram_clone_flutter/src/components/image_data.dart';
import 'package:instagram_clone_flutter/src/components/post_widget.dart';
import 'package:instagram_clone_flutter/src/controller/home_controller.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  Widget _myStory() {
    // 상단 내 스토리
    return Stack(
      children: [
        AvatarWidget(
          type: AvatarType.TYPE2,
          thumbPath:
              'https://i.pinimg.com/originals/4f/fd/f4/4ffdf44d886b79b366c27486051a1081.png',
          size: 60,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
            ),
            child: const Text(
              '+',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _storyBoardList() {
    // 상단 스토리 리스트
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          _myStory(),
          const SizedBox(
            width: 5,
          ),
          ...List.generate(
            // ... -> 리스트 배열을 나열하겠다는 뜻
            10,
            (index) => AvatarWidget(
              type: AvatarType.TYPE1,
              thumbPath:
                  'https://blog.kakaocdn.net/dn/bD47H0/btqK83X5qWz/cwP9qA8R3r2BnJOaTtZXrK/img.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _postList() {
    // 게시물 위젯
    return Obx(
      () => Column(
        children: List.generate(
          controller.postList.length,
          (index) => PostWidget(post: controller.postList[index]),
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: ImageData(
          IconsPath.logo,
          width: 300,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(
                IconsPath.directMessage,
                width: 55,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          _storyBoardList(),
          _postList(),
        ],
      ),
    );
  }
}
