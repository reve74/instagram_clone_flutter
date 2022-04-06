import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/src/components/avatar_widget.dart';

class ActiveHistory extends StatelessWidget {
  const ActiveHistory({Key? key}) : super(key: key);

  Widget _activeitemOne() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          AvatarWidget(
            type: AvatarType.TYPE2,
            size: 40,
            thumbPath:
                'https://scontent-gmp1-1.cdninstagram.com/v/t51.2885-19/277401441_398290504969761_1634878627965687074_n.jpg?stp=dst-jpg_s150x150&_nc_ht=scontent-gmp1-1.cdninstagram.com&_nc_cat=1&_nc_ohc=5e1sjGCoQEEAX_l07Mf&edm=ALCvFkgBAAAA&ccb=7-4&oh=00_AT-3y7rSIK-ENRXAhdfM7KFwabL3aiZxE43CvsvtShwlvQ&oe=62536795&_nc_sid=643ae9',
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: '_seorina',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: '님이 회원님의 게시물을 좋아합니다.',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: ' 5일전',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _newRecentlyActiveView(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text(
            title,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 15),
          _activeitemOne(),
          _activeitemOne(),
          _activeitemOne(),
          _activeitemOne(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          '활동',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _newRecentlyActiveView('오늘'),
            _newRecentlyActiveView('이번 주'),
            _newRecentlyActiveView('이번 달'),
          ],
        ),
      ),
    );
  }
}
