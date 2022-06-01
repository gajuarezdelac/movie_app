import 'package:flutter/material.dart';
import 'package:movie_app/src/utils/constants.dart';

class ViewMoviePage extends StatefulWidget {
  const ViewMoviePage({Key? key}) : super(key: key);

  static String routeName = "view_movie_page";

  @override
  State<ViewMoviePage> createState() => _ViewMoviePageState();
}

class _ViewMoviePageState extends State<ViewMoviePage> {
  final double _headerHeight = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Constants.blueGeneric,
      ),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: Text(""),
          )),
    );
  }
}
