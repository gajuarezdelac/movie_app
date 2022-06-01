import 'package:flutter/material.dart';
import 'package:movie_app/src/models/response/my_movie.dart';

@immutable
abstract class MoviesState {
  final String? messageError;
  final List<MyMovie>? responseAll;
  final MyMovie? responseById;
  final int? insertResponse;
  final int? updateResponse;
  final int? deleteResponse;

  const MoviesState(
      {this.messageError,
      this.responseAll,
      this.responseById,
      this.deleteResponse,
      this.insertResponse,
      this.updateResponse});
}

// Estdo inicial
class InitialMyMoviesState extends MoviesState {}

// Get all movies created for me.
class IsLoadingGetAllMoviesState extends MoviesState {}

class ErrorGetAllMoviesState extends MoviesState {
  const ErrorGetAllMoviesState({required String errorMessage})
      : super(messageError: errorMessage);
}

class SuccessGetAllMoviesState extends MoviesState {
  const SuccessGetAllMoviesState({required List<MyMovie> responseAll})
      : super(responseAll: responseAll);
}

// Get All movies
class IsLoadingGetAllMoviesByTitleState extends MoviesState {}

class ErrorGetAllMoviesByTitleState extends MoviesState {
  const ErrorGetAllMoviesByTitleState({required String errorMessage})
      : super(messageError: errorMessage);
}

class SuccessGetAllMoviesByTitleState extends MoviesState {
  const SuccessGetAllMoviesByTitleState({required List<MyMovie> responseAll})
      : super(responseAll: responseAll);
}

// Estado para buscar pelicula por ID
class IsLoadingGetMovieById extends MoviesState {}

class ErrorGetMovieById extends MoviesState {
  const ErrorGetMovieById({required String errorMessage})
      : super(messageError: errorMessage);
}

class SuccessGetMovieById extends MoviesState {
  const SuccessGetMovieById({required MyMovie responseById})
      : super(responseById: responseById);
}

// Estado para  crear pelicula

class IsLoadingCreateMovie extends MoviesState {}

class ErrorCreateMovie extends MoviesState {
  const ErrorCreateMovie({required String errorMessage})
      : super(messageError: errorMessage);
}

class SuccessCreateMovie extends MoviesState {
  const SuccessCreateMovie({required int insertResponse})
      : super(insertResponse: insertResponse);
}

// Estado para actualizar la pelicula

class IsLoadingUpdateMovie extends MoviesState {}

class ErrorUpdateMovie extends MoviesState {
  const ErrorUpdateMovie({required String errorMessage})
      : super(messageError: errorMessage);
}

class SuccessUpdateMovie extends MoviesState {
  const SuccessUpdateMovie({required int updateResponse})
      : super(updateResponse: updateResponse);
}

// Estado para eliminar la pelicula

class IsLoadingDeleteMovie extends MoviesState {}

class ErrorDeleteMovie extends MoviesState {
  const ErrorDeleteMovie({required String errorMessage})
      : super(messageError: errorMessage);
}

class SuccessDeleteMovie extends MoviesState {
  const SuccessDeleteMovie({required int deleteResponse})
      : super(deleteResponse: deleteResponse);
}
