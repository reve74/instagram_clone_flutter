import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/src/components/avatar_widget.dart';

class UserCard extends StatelessWidget {
  final String userId;
  final String description;
  const UserCard({Key? key, required this.userId, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: 150,
      height: 220,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 15,
            left: 15,
            bottom: 0,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                AvatarWidget(
                  type: AvatarType.TYPE2,
                  thumbPath:
                      'https://scontent-gmp1-1.cdninstagram.com/v/t51.2885-19/272098298_211628487835271_4'
                      '69254811598076339_n.jpg?stp=dst-jpg_s320x320&_nc_ht=scontent-gmp1-1.cdninstagram.com&_nc_cat=1&_nc_ohc=fAI-Xp5Xk8oAX97H_E'
                      'o&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT-E7DyMzPgZBeGmnHMhk9_gWXhYUoSvvpXKiycxdMZf7w&oe=622EC32E&_nc_sid=7bff83',
                  size: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '$userId',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Text(
                  '$description',
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('팔로우'),
                ),
              ],
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.close,
                size: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
