import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum AvatarType { TYPE1, TYPE2, TYPE3 } // 아바타 타입

class AvatarWidget extends StatelessWidget {
  bool? hasStory;
  String? thumbPath;
  String? nickName;
  AvatarType type;
  double? size;

  AvatarWidget({
    Key? key,
    required this.type,
    required this.thumbPath,
    this.nickName,
    this.hasStory,
    this.size = 60,
  }) : super(key: key);

  Widget type1Widget() {
    // 타입1 위젯(다른사람 스토리)
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.purple,
            Colors.orange,
          ],
        ),
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: type2Widget(),
    );
  }

  Widget type2Widget() {
    // 타입2 위젯(내 스토리)
    return Container(
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size!),
          child: SizedBox(
            width: size,
            height: size,
            child: CachedNetworkImage(
              imageUrl: thumbPath!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget type3Widget() { // 게시물 위젯
    return Row(
      children: [
        type1Widget(),
        Text(
          nickName ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarType.TYPE1:
        return type1Widget();
        break;
      case AvatarType.TYPE2:
        return type2Widget();
      case AvatarType.TYPE3:
        return type3Widget();
        break;
    }
    return Container();
  }
}
