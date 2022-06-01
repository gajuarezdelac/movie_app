import 'package:movie_app/src/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocsServices(String token) {
  return [
    BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
    ),
    BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(),
    ),
    BlocProvider<MovieBloc>(
      create: (context) => MovieBloc(),
    ),
  ];
}
