import 'package:movie_app/src/models/params/movie_params.dart';
import 'package:movie_app/src/models/response/my_movie.dart';
import 'package:movie_app/src/services/movies_service.dart';

class MoviesRepository {
  MoviesService service = MoviesService();

  Future<List<MyMovie>> getAllMyMovies() => service.getAllMyMovies();

  Future<List<MyMovie>> getAllMovies({required title}) =>
      service.getAllMovies(title);

  Future<MyMovie> fetchMovieById({required int id}) =>
      service.fetchMovieById(id);

  Future<int> creteMovie({required MovieParams params}) =>
      service.creteMovie(params);

  Future<int> updateMovie({required MovieParams params}) =>
      service.updateMovie(params);

  Future<int> deleteMovie({required List<MyMovie> listIds}) =>
      service.deleteMovie(listIds);
}
