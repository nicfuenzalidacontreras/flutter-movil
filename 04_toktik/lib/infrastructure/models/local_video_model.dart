import 'package:toktik/domain/entities/vides_post.dart';

class LocalVideModel {
  LocalVideModel(
      {required this.name,
      required this.videoUrl,
      this.likes = 0,
      this.views = 0});

  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  factory LocalVideModel.fromJson(Map<String, dynamic> json) => LocalVideModel(
        name: json['name'] ?? 'No video name',
        videoUrl: json['videoUrl'],
        likes: json['likes'] ?? 0,
        views: json['views'] ?? 0,
      );

  VideoPost toVideoPostEntity() =>
      VideoPost(caption: name, videoUrl: videoUrl, likes: likes, views: views);
}
