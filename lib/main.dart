import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/bloc/bloc_observer.dart';
import 'package:movie_app/src/pages/welcome_page/welcome_page.dart';
import 'package:movie_app/src/providers/blocs_provider.dart';
import 'package:movie_app/src/routes/routes.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // providers: blocsServices(token == null ? "" : ""),
      providers: blocsServices(""),
      child: MaterialApp(
        title: 'Movie APP',
        debugShowCheckedModeBanner: false,
        initialRoute: WelcomePage.routeName,
        theme: ThemeData(
          // scaffoldBackgroundColor: Colors.blueAccent,
          // visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Comfortaa',
          // appBarTheme: const AppBarTheme(elevation: 0.0),
        ),
        routes: getApplicationRoutes(),
      ),
    );
  }
}
