import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:movie_app/src/bloc/bloc.dart';
import 'package:movie_app/src/models/params/carousel_horizontal_model.dart';
import 'package:movie_app/src/models/params/carousel_model.dart';
import 'package:movie_app/src/models/params/movie_params.dart';
import 'package:movie_app/src/pages/notification_page/notification_page.dart';
import 'package:movie_app/src/utils/constants.dart';
import 'package:movie_app/src/utils/themes.dart';
import 'package:movie_app/src/widgets/header_widget.dart';
import 'package:movie_app/src/widgets/navigation_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String routeName = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieBloc? _movieBloc;

  double _value = 2000;
  int? current;
  final double _headerHeight = 250;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (int i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  final data = [
    Post(
      image: 'assets/images/promocion1.png',
      title: 'Finding your ikigai in your middle age',
      author: 'John Johny',
      date: '25 Mar 2020',
    ),
    Post(
      image: 'assets/images/promocion2.png',
      title: 'How to Lead Before You Are in Charge',
      author: 'John Johny',
      date: '24 Mar 2020',
    ),
    Post(
      image: 'assets/images/promocion3.png',
      title: 'How Minimalism Brought Me',
      author: 'John Johny',
      date: '15 Mar 2020',
    ),
    Post(
      image: 'assets/images/promocion1.png',
      title: 'The Most Important Color In UI Design',
      author: 'John Johny',
      date: '11 Mar 2020',
    ),
    Post(
      image: 'assets/images/promocion1.png',
      title: 'Finding your ikigai in your middle age',
      author: 'John Johny',
      date: '25 Mar 2020',
    ),
    Post(
      image: 'assets/images/promocion2.png',
      title: 'How to Lead Before You Are in Charge',
      author: 'John Johny',
      date: '24 Mar 2020',
    ),
    Post(
      image: 'assets/images/promocion3.png',
      title: 'How Minimalism Brought Me',
      author: 'John Johny',
      date: '15 Mar 2020',
    ),
    Post(
      image: 'assets/images/promocion1.png',
      title: 'The Most Important Color In UI Design',
      author: 'John Johny',
      date: '11 Mar 2020',
    ),
    Post(
      image: 'assets/images/promocion1.png',
      title: 'Finding your ikigai in your middle age',
      author: 'John Johny',
      date: '25 Mar 2020',
    ),
    Post(
      image: 'assets/images/promocion2.png',
      title: 'How to Lead Before You Are in Charge',
      author: 'John Johny',
      date: '24 Mar 2020',
    ),
    Post(
      image: 'assets/images/promocion3.png',
      title: 'How Minimalism Brought Me',
      author: 'John Johny',
      date: '15 Mar 2020',
    ),
    Post(
      image: 'assets/images/promocion1.png',
      title: 'The Most Important Color In UI Design',
      author: 'John Johny',
      date: '11 Mar 2020',
    ),
  ];

  void initialData() async {
    _movieBloc = BlocProvider.of<MovieBloc>(context);

    // _movieBloc?.add(CreateMovieEvent(
    //     params: MovieParams(
    //         id: 1,
    //         title: "Primer titul",
    //         category: "Primer titul",
    //         author: "Primer titul")));

    // _movieBloc?.add(CreateMovieEvent(
    //     params: MovieParams(
    //         id: 1,
    //         title: "Primer titul",
    //         category: "Primer titul",
    //         author: "Primer titul")));

    // _movieBloc?.add(const GetAllMyMoviesEvent());

    print("Completado");
  }

  @override
  void initState() {
    initialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Row(
              children: const [
                Text(
                  "Movie",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                Text(
                  "App",
                  style: TextStyle(
                      color: Color.fromARGB(255, 242, 206, 63),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ],
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Constants.blueGeneric,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationPage()));
              },
              child: Container(
                margin: const EdgeInsets.only(
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: <Widget>[
                    const Icon(Icons.notifications),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: const Text(
                          '5',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        // bottomNavigationBar: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: ElevatedButton(
        //     // color: Color.fromARGB(255, 32, 177, 49),
        //     onPressed: () {},

        //     style: ElevatedButton.styleFrom(
        //       primary: const Color.fromARGB(255, 13, 43, 112),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(25),
        //       ),
        //       elevation: 15.0,
        //     ),
        //     child: InkWell(
        //       child: SizedBox(
        //         height: kToolbarHeight,
        //         width: double.infinity,
        //         child: Padding(
        //           padding: const EdgeInsets.only(left: 30, right: 30),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: const [
        //               Icon(Icons.monetization_on, size: 25),
        //               SizedBox(width: 10),
        //               Text(
        //                 "Solicitar Credito",
        //                 style: TextStyle(
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.w700,
        //                   color: Color.fromARGB(255, 255, 255, 255),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        drawer: const NavigationDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  SizedBox(
                    height: _headerHeight,
                    child: HeaderWidget(
                      _headerHeight,
                      false,
                      Icons.home_max,
                    ), //let's create a common header widget
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 190,
                              child: Swiper(
                                onIndexChanged: (index) {
                                  setState(() {
                                    current = index;
                                  });
                                },
                                autoplay: true,
                                layout: SwiperLayout.DEFAULT,
                                itemCount: carousels.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                carousels[index].image),
                                            fit: BoxFit.cover)),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: map<Widget>(carousels, (index, image) {
                                return Container(
                                  alignment: Alignment.centerLeft,
                                  height: 6,
                                  width: 6,
                                  margin: const EdgeInsets.only(right: 2),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: current == index
                                          ? Colors.black
                                          : Colors.black26),
                                );
                              }),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: SizedBox(
                          height: 45,
                          child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const VerticalDivider(
                              color: Colors.transparent,
                              width: 5,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              Post genre = data[index];
                              return Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black45,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        genre.author!,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45,
                                          fontFamily: 'muli',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                      ),
                      Text(
                        "Continuar viendo",
                        // textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 24,
                            letterSpacing: 1,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                          height: 320,
                          padding:
                              EdgeInsets.only(left: 10, right: 10, top: 10),
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  VerticalDivider(
                                    color: Colors.transparent,
                                    width: 15,
                                  ),
                              scrollDirection: Axis.horizontal,
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                Post movie = data[index];
                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {},
                                        child: ClipRRect(
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/adventure-movie-poster-template-design-7b13ea2ab6f64c1ec9e1bb473f345547_screen.jpg?ts=1636999411',
                                            imageBuilder:
                                                (context, imageProvider) {
                                              return Container(
                                                width: 180,
                                                height: 250,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(12),
                                                  ),
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            },
                                            placeholder: (context, url) =>
                                                Container(
                                              width: 180,
                                              height: 250,
                                              child: Center(
                                                child: Platform.isAndroid
                                                    ? CircularProgressIndicator()
                                                    : CupertinoActivityIndicator(),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Container(
                                              width: 180,
                                              height: 250,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/adventure-movie-poster-template-design-7b13ea2ab6f64c1ec9e1bb473f345547_screen.jpg?ts=1636999411'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 180,
                                        child: Text(
                                          movie.author!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black45,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'muli',
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 14,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 14,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 14,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 14,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 14,
                                            ),
                                            Text(
                                              "3.4",
                                              style: TextStyle(
                                                color: Colors.black45,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]);
                              })),
                      Text(
                        "Actors",
                        // textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20,
                            letterSpacing: 1,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 110,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          separatorBuilder: (context, index) => VerticalDivider(
                            color: Colors.transparent,
                            width: 5,
                          ),
                          itemBuilder: (context, index) {
                            Post person = data[index];
                            return Column(
                              children: <Widget>[
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  elevation: 3,
                                  child: ClipRRect(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://stylesatlife.com/wp-content/uploads/2021/11/Leonardo-DiCaprio-Face-Shape.jpg',
                                      imageBuilder: (context, imageProvider) {
                                        return Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(100),
                                            ),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                      placeholder: (context, url) => SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Center(
                                          child: Platform.isAndroid
                                              ? CircularProgressIndicator()
                                              : CupertinoActivityIndicator(),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                'https://imagenes.elpais.com/resizer/MDhKb97nNuZnCbNTYlnMFP6GAwU=/1960x1470/ep01.epimg.net/cultura/imagenes/2013/07/14/actualidad/1373784041_506217_1373879254_noticia_fotograma.jpg'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text(
                                      "Ryan Peter".toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 8,
                                        fontFamily: 'muli',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text(
                                      "Drama",
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 8,
                                        fontFamily: 'muli',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 6,
                        color: sparatorColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class Post {
  final String? title;
  final String? image;
  final String? author;
  final String? date;

  Post({this.title, this.image, this.author, this.date});
}
