import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_flutter/src/pages/upload/upload_description.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:path/path.dart';
import 'package:image/image.dart' as imageLib;
import 'package:photofilters/photofilters.dart';

class UploadController extends GetxController {
  var albums = <AssetPathEntity>[]; // AssetPathEntity?
  RxString headerTitle = ''.obs;
  RxList<AssetEntity> imageList = <AssetEntity>[].obs; // AssetEntity?
  Rx<AssetEntity> selectedImage = AssetEntity(
    id: '0',
    typeInt: 0,
    width: 0,
    height: 0,
  ).obs;

  File? filteredImage;

  @override
  void onInit() {
    super.onInit();
    print('uploadpage');
    _loadPhoto();
  }

  void _loadPhoto() async {
    // 사진 불러오기
    var result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        filterOption: FilterOptionGroup(
          imageOption: const FilterOption(
            sizeConstraint: SizeConstraint(minHeight: 100, minWidth: 100),
          ),
          orders: [
            const OrderOption(type: OrderOptionType.createDate, asc: false),
            // 최신이미지 먼저 보기
          ],
        ),
      );
      _loadData();
    } else {
      // message
    }
  }

  void _loadData() async {
    changeAlbum(albums.first);
  }

  Future<void> _pagingPhotos(AssetPathEntity album) async {
    // 사진 불러오기 페이징
    imageList.clear();
    var photos = await album.getAssetListPaged(0, 30);
    imageList.addAll(photos);
    changeSelectedImage(imageList.first);
  }

  changeSelectedImage(AssetEntity image) {
    selectedImage(image);
  }

  void changeAlbum(AssetPathEntity album) async {
    headerTitle(album.name);
    await _pagingPhotos(album); // 이미지 파일이 많을경우 별도로 페이징 처리
  }

  void gotoImageFilter() async {
    var file = await selectedImage.value.file;
    var fileName = basename(file!.path);
    var image = imageLib.decodeImage(file.readAsBytesSync());
    image = imageLib.copyResize(image!, width: 1000);
    var imagefile = await Navigator.push(
      Get.context!,
      MaterialPageRoute(
        builder: (context) =>
            PhotoFilterSelector(
              appBarColor: Colors.pinkAccent,
              title: const Text("Photo Filter Example"),
              image: image!,
              filters: presetFiltersList,
              filename: fileName,
              loader: const Center(child: CircularProgressIndicator()),
              fit: BoxFit.contain,
            ),
      ),
    );
    if (imagefile != null && imagefile.containsKey('image_filtered')) {
      filteredImage = imagefile['image_filtered'];
      Get.to(()=> const UploadDescription());
    }
  }
}
