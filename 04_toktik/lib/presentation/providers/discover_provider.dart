import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/vides_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/loca_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  //TODO: repository, datasource

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 3));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideModel.fromJson(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
