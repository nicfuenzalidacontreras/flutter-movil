import 'package:cinemapedia/domain/entities/actor.dart';

abstract class ActorsDataSource {
  Future<List<Actor>> getActorByMovie(String movieId);
}
