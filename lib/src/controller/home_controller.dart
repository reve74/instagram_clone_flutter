import 'package:get/get.dart';
import 'package:instagram_clone_flutter/src/models/post.dart';
import 'package:instagram_clone_flutter/src/repository/post_repository.dart';

class HomeController extends GetxController {
  RxList<Post> postList = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadFeedList();
  }
  void _loadFeedList() async{
    var feedList = await PostRepository.loadFeedList();
    postList.addAll(feedList);
  }
}