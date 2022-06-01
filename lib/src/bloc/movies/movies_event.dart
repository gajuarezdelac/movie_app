import 'package:flutter/material.dart';
import 'package:movie_app/src/models/params/movie_params.dart';
import 'package:movie_app/src/models/response/my_movie.dart';

@immutable
abstract class MoviesEvent {
  final String? title;
  final MovieParams? params;
  final int? id;
  final List<MyMovie>? listIds;

  const MoviesEvent({this.id, this.title, this.params, this.listIds});
}

class GetAllMyMoviesEvent extends MoviesEvent {
  const GetAllMyMoviesEvent() : super();
}

class GetAllMoviesByTitleEvent extends MoviesEvent {
  const GetAllMoviesByTitleEvent({required String title}) : super(title: title);
}

class GetMovieByIdEvent extends MoviesEvent {
  const GetMovieByIdEvent({required int id}) : super(id: id);
}

// CreateMovieEvent

class CreateMovieEvent extends MoviesEvent {
  const CreateMovieEvent({required MovieParams params}) : super(params: params);
}

// UpdateMovieEvent
class UpdateMovieEvent extends MoviesEvent {
  const UpdateMovieEvent({required MovieParams params}) : super(params: params);
}

// DeleteMovieEvent
class DeleteMovieEvent extends MoviesEvent {
  const DeleteMovieEvent({required List<MyMovie> listIds})
      : super(listIds: listIds);
}
