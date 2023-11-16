import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/vides_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepository});

  Future<void> loadNextPage() async {
    //await Future.delayed(const Duration(seconds: 3));

    //final List<VideoPost> newVideos = videoPosts
    //.map((video) => LocalVideModel.fromJson(video).toVideoPostEntity())
    //.toList();

    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
