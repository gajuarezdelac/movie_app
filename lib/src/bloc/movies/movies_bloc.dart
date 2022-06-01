import 'package:bloc/bloc.dart';
import 'package:movie_app/src/bloc/movies/movies_event.dart';
import 'package:movie_app/src/bloc/movies/movies_state.dart';
import 'package:movie_app/src/models/response/my_movie.dart';
import 'package:movie_app/src/repository/movies_repository.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  MovieBloc() : super(InitialMyMoviesState());

  final _repository = MoviesRepository();

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    yield InitialMyMoviesState();

    // Evento para recuperar todas  mis pelliculas creadas por mi
    if (event is GetAllMyMoviesEvent) {
      yield IsLoadingGetAllMoviesState();
      try {
        List<MyMovie> response = await _repository.getAllMyMovies();

        yield SuccessGetAllMoviesState(responseAll: response);
      } catch (e) {
        yield ErrorGetAllMoviesState(errorMessage: e.toString());
      }
    }

    // Evento para traer todas las peliculas por titulo

    if (event is GetAllMoviesByTitleEvent) {
      yield IsLoadingGetAllMoviesByTitleState();
      try {
        List<MyMovie> response = await _repository.getAllMyMovies();

        yield SuccessGetAllMoviesByTitleState(responseAll: response);
      } catch (e) {
        yield ErrorGetAllMoviesByTitleState(errorMessage: e.toString());
      }
    }

    // Evento para buscar por ID

    if (event is GetMovieByIdEvent) {
      yield IsLoadingGetMovieById();
      try {
        MyMovie response = await _repository.fetchMovieById(id: event.id!);

        yield SuccessGetMovieById(responseById: response);
      } catch (e) {
        yield ErrorGetMovieById(errorMessage: e.toString());
      }
    }

    // Evento para crear una pelicula nueva

    if (event is CreateMovieEvent) {
      yield IsLoadingCreateMovie();
      try {
        int response = await _repository.creteMovie(params: event.params!);

        yield SuccessCreateMovie(insertResponse: response);
      } catch (e) {
        yield ErrorCreateMovie(errorMessage: e.toString());
      }
    }

    // Evento para actualizar un registro
    if (event is UpdateMovieEvent) {
      yield IsLoadingUpdateMovie();
      try {
        int response = await _repository.updateMovie(params: event.params!);

        yield SuccessUpdateMovie(updateResponse: response);
      } catch (e) {
        yield ErrorUpdateMovie(errorMessage: e.toString());
      }
    }

    // Evento para eliminar un registro
    if (event is DeleteMovieEvent) {
      yield IsLoadingDeleteMovie();
      try {
        int response = await _repository.deleteMovie(listIds: event.listIds!);

        yield SuccessDeleteMovie(deleteResponse: response);
      } catch (e) {
        yield ErrorDeleteMovie(errorMessage: e.toString());
      }
    }
  }
}
