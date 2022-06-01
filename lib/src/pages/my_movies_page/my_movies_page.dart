import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/models/params/movie_params.dart';
import 'package:movie_app/src/models/response/my_movie.dart';
import 'package:movie_app/src/pages/my_movies_page/widgets/edit_movie.dart';
import 'package:movie_app/src/pages/my_movies_page/widgets/new_movie.dart';
import 'package:movie_app/src/utils/constants.dart';
import 'package:movie_app/src/utils/dialogs.dart';
import 'package:movie_app/src/widgets/alerts.dart';
import 'package:movie_app/src/widgets/generic_page.dart';
import 'package:movie_app/src/widgets/snackbars.dart';

import '../../bloc/movies/bloc.dart';

class MyMoviesPage extends StatefulWidget {
  const MyMoviesPage({Key? key}) : super(key: key);

  static String routeName = "my_movies_page";

  @override
  State<MyMoviesPage> createState() => _MyMoviesPageState();
}

class _MyMoviesPageState extends State<MyMoviesPage> {
  MovieBloc? _movieBloc;

  List<MyMovie> listRequest = [];
  List<MyMovie> listRequestTemp = [];

  TextEditingController searchText = TextEditingController();

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

    _movieBloc?.add(const GetAllMoviesByTitleEvent(title: ""));
  }

  @override
  void initState() {
    initialData();
    super.initState();
  }

  final data = [
    Post(
        image: 'assets/images/promocion1.png',
        title: 'Finding your ikigai in your middle age',
        author: 'John Johny',
        date: '25 Mar 2020',
        selected: false),
    Post(
        image: 'assets/images/promocion2.png',
        title: 'How to Lead Before You Are in Charge',
        author: 'John Johny',
        date: '24 Mar 2020',
        selected: false),
    Post(
        image: 'assets/images/promocion3.png',
        title: 'How Minimalism Brought Me',
        author: 'John Johny',
        date: '15 Mar 2020',
        selected: false),
    Post(
        image: 'assets/images/promocion1.png',
        title: 'The Most Important Color In UI Design',
        author: 'John Johny',
        date: '11 Mar 2020',
        selected: false),
    Post(
        image: 'assets/images/promocion1.png',
        title: 'Finding your ikigai in your middle age',
        author: 'John Johny',
        date: '25 Mar 2020',
        selected: false),
    Post(
        image: 'assets/images/promocion2.png',
        title: 'How to Lead Before You Are in Charge',
        author: 'John Johny',
        date: '24 Mar 2020',
        selected: false),
    Post(
        image: 'assets/images/promocion3.png',
        title: 'How Minimalism Brought Me',
        author: 'John Johny',
        date: '15 Mar 2020',
        selected: false),
    Post(
        image: 'assets/images/promocion1.png',
        title: 'The Most Important Color In UI Design',
        author: 'John Johny',
        date: '11 Mar 2020',
        selected: false),
    Post(
        image: 'assets/images/promocion1.png',
        title: 'Finding your ikigai in your middle age',
        author: 'John Johny',
        date: '25 Mar 2020',
        selected: false),
    Post(
        image: 'assets/images/promocion2.png',
        title: 'How to Lead Before You Are in Charge',
        author: 'John Johny',
        date: '24 Mar 2020',
        selected: false),
    Post(
        image: 'assets/images/promocion3.png',
        title: 'How Minimalism Brought Me',
        author: 'John Johny',
        date: '15 Mar 2020',
        selected: false),
    Post(
        image: 'assets/images/promocion1.png',
        title: 'The Most Important Color In UI Design',
        author: 'John Johny',
        date: '11 Mar 2020',
        selected: false),
  ];

  var items = List<String>.generate(10, (i) => "$i");

  final lightTextColor = const Color.fromARGB(255, 120, 119, 119);
  final textFieldColor = const Color(0xffF5F6FA);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 250,
      backgroundColor: const Color.fromARGB(255, 8, 8, 8),
      color: const Color.fromARGB(255, 236, 232, 232),
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        _movieBloc?.add(const GetAllMoviesByTitleEvent(title: ""));
      },
      child: Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          iconTheme:
              const IconThemeData(color: Color.fromARGB(248, 255, 255, 255)),
          title: Center(
            child: Row(
              children: const [
                Text(
                  "Mis ",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                Text(
                  "Peliculas",
                  style: TextStyle(
                      color: Color.fromARGB(255, 242, 206, 63),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            listRequest.isNotEmpty
                ? IconButton(
                    color: Color.fromARGB(255, 244, 244, 244),
                    icon: const Icon(Icons.check_box),
                    tooltip: 'Check All',
                    onPressed: () => selecttAllRequest(),
                  )
                : Container(),
          ],
          elevation: 0,

          backgroundColor: Constants.blueGeneric,
        ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            child: Icon(Icons.delete),
            onPressed: () {
              deleteMasive();
            },
            heroTag: null,
            backgroundColor: Colors.red,
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const NewMovie()));
            },
            heroTag: null,
            backgroundColor: Color.fromARGB(255, 70, 168, 13),
          )
        ]),
        // bottomNavigationBar: listRequest.isNotEmpty
        //     ? Padding(
        //         padding: const EdgeInsets.only(
        //             left: 8, right: 8, top: 8, bottom: 25),
        //         child: ElevatedButton(
        //           // color: Color.fromARGB(255, 32, 177, 49),
        //           onPressed: () {
        //             paymentMasive();
        //           },
        //           style: ElevatedButton.styleFrom(
        //             primary: Color.fromARGB(255, 13, 112, 54),
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(25),
        //             ),
        //             elevation: 15.0,
        //           ),
        //           child: InkWell(
        //             child: SizedBox(
        //               height: kToolbarHeight,
        //               width: double.infinity,
        //               child: Padding(
        //                 padding: const EdgeInsets.only(left: 30, right: 30),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     const Text(
        //                       "Total a pagar",
        //                       style: TextStyle(
        //                         fontSize: 20,
        //                         fontWeight: FontWeight.w700,
        //                         color: Color.fromARGB(255, 255, 255, 255),
        //                       ),
        //                     ),
        //                     Text(
        //                       " MXN",
        //                       style: const TextStyle(
        //                         fontSize: 20,
        //                         fontWeight: FontWeight.w700,
        //                         color: Color.fromARGB(255, 255, 255, 255),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       )
        //     : SizedBox(),
        body: BlocConsumer<MovieBloc, MoviesState>(
          listener: (context, state) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            if (state is IsLoadingGetAllMoviesByTitleState) {
              ProgressDialog.show(context);
              // showGeneralLoading(context);
            } else if (state is SuccessGetAllMoviesByTitleState) {
              ProgressDialog.dissmiss1(context);
              setState(() {
                listRequest = state.responseAll!;
                listRequestTemp = state.responseAll!;
              });
            }
            if (state is ErrorGetAllMoviesByTitleState) {
              ProgressDialog.dissmiss1(context);
              // snackbarError(context, state.messageError!);
            }

            if (state is IsLoadingDeleteMovie) {
              ProgressDialog.show(context);
              // showGeneralLoading(context);
            } else if (state is SuccessDeleteMovie) {
              ProgressDialog.dissmiss1(context);
              _movieBloc?.add(const GetAllMoviesByTitleEvent(title: ""));
              snackbarSuccess(context, "Registros elimanados correctamente");
            }
            if (state is ErrorDeleteMovie) {
              snackbarError(context, state.messageError!);
              ProgressDialog.dissmiss1(context);
              // Navigator.of(context).pop();

              // snackbarError(context, state.messageError!);
            }

            // if (state is IsLoadingPaymentMasive) {
            //   ProgressDialog.show(context);
            // }
            // if (state is SuccessPaymentMasive) {
            //   ProgressDialog.dissmiss1(context);
            //   _paymentBloc?.add(const GetRequestEvent(idRequestA: ""));

            //   if (state.paymentResponse!.data.incorrectos.isNotEmpty) {
            //     confirm(context,
            //         title: "Uy, Errores 🥺",
            //         values: state.paymentResponse!.data.incorrectos);
            //     return;
            //   }

            //   // snackbarSuccess(context, "Pago realizado con exito");
            // }

            // if (state is ErrorUpdatePaymentMasive) {
            //   ProgressDialog.dissmiss1(context);
            //   snackbarError(context, state.messageError!);
            // }
          },
          builder: (context, state) {
            if (state is ErrorGetAllMoviesByTitleState) {
              return errorWidget;
            }

            if (state is SuccessGetAllMoviesByTitleState) {
              if (state.responseAll!.isEmpty) {
                return emptyWidget;
              }

              return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: MultiBlocListener(
                    listeners: [
                      listenerMovies(),
                      listenerDeleteMovies(),
                    ],
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                            },
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.white70, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(
                                    left: 0.0, right: 0.0, bottom: 10, top: 10),
                                child: Wrap(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Buscar pelicula",
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(255, 18, 0, 0),
                                        ),
                                      ),
                                    ),
                                    // const SizedBox(height: 40),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     const Text(
                                    //       "Total acumulado: ",
                                    //       style: TextStyle(
                                    //         fontSize: 16,
                                    //         fontWeight: FontWeight.w700,
                                    //         color: Color.fromARGB(255, 0, 0, 0),
                                    //       ),
                                    //     ),
                                    //     Text(
                                    //       "\$${getAmountTotal()} MXN",
                                    //       style: const TextStyle(
                                    //         fontSize: 16,
                                    //         // fontWeight: FontWeight.w700,
                                    //         color: Color.fromARGB(255, 0, 7, 19),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     const Text(
                                    //       "Total a pagar: ",
                                    //       style: TextStyle(
                                    //         fontSize: 19,
                                    //         fontWeight: FontWeight.w700,
                                    //         color:
                                    //             Color.fromARGB(255, 242, 242, 242),
                                    //       ),
                                    //     ),
                                    //     Text(
                                    //       "\$${getAmountSelected()} MXN",
                                    //       style: const TextStyle(
                                    //         fontSize: 19,
                                    //         color:
                                    //             Color.fromARGB(255, 242, 242, 242),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // )
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 20.0,
                                          right: 20.0,
                                          bottom: 10,
                                          top: 15.0),
                                      child: TextField(
                                        onSubmitted: (String value) {
                                          _movieBloc?.add(
                                              GetAllMoviesByTitleEvent(
                                                  title: value));
                                        },
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                    vertical: 14),
                                            filled: true,
                                            fillColor: textFieldColor,
                                            hintText:
                                                'Escribe el titulo de la pelicula',
                                            hintStyle: const TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: listRequest.length,
                                itemBuilder: (context, index) {
                                  final item = listRequest[index];

                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Card(
                                      child: Column(
                                        children: [
                                          const SizedBox(),
                                          ListTile(
                                            leading: ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                minWidth: 44,
                                                minHeight: 44,
                                                maxWidth: 64,
                                                maxHeight: 64,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                    "https://e.rpp-noticias.io/normal/2020/01/15/350335_887206.jpg",
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            title: Text(
                                                "Pelicula ${item.id}-${item.name}"),
                                            subtitle: Text(
                                                "Año de lanzamiento: ${item.year}, Descripción: ${item.author}, Categoria: ${item.category} "),
                                            trailing: Checkbox(
                                                value: item.selected,
                                                onChanged: (val) => {
                                                      setState(() {
                                                        item.selected = val!;
                                                        // getAmountSelected();
                                                      })
                                                    }),
                                            isThreeLine: true,
                                            contentPadding:
                                                const EdgeInsets.all(10.0),
                                            selected: item.selected,
                                            selectedColor: const Color.fromARGB(
                                                255, 1, 6, 10),
                                            selectedTileColor:
                                                const Color.fromARGB(
                                                    255, 192, 230, 255),
                                            onTap: () {
                                              setState(() {
                                                item.selected = !item.selected;
                                              });
                                            },
                                            onLongPress: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditMovie(
                                                            params: item,
                                                          )));
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ));
            }
            return Container(width: 0.0);
          },
        ),
      ),
    );
  }

  // confirm(BuildContext context,
  //     {required String title, required List<Incorrectos> values}) {
  //   showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       title: Text(title),
  //       content: SizedBox(
  //         width: double.maxFinite,
  //         child: ListView.builder(
  //           shrinkWrap: true,
  //           itemBuilder: (ctx, index) {
  //             return SimpleDialogOption(
  //               onPressed: () => Navigator.pop(context),
  //               child: Padding(
  //                 padding: const EdgeInsets.only(bottom: 5, top: 5),
  //                 child: Text(
  //                     "Solicitud: ${values[index].IDREQUEST} Motivo: ${values[index].MOTIVO ?? "Sin motivo"}"),
  //               ),
  //             );
  //           },
  //           itemCount: values.length,
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //           child: const Text("Aceptar"),
  //           onPressed: () => Navigator.pop(context),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // String convertToHTTPS(String url) {
  //   if (url.indexOf("http://") == 0) {
  //     return url.replaceAll("http://", "https://");
  //   } else {
  //     return url;
  //   }
  // }

  void selecttAllRequest() {
    for (var element in listRequest) {
      setState(() {
        element.selected = !element.selected;
      });
    }
  }

  void deleteMasive() {
    List<MyMovie> listFiltered =
        listRequest.where((x) => x.selected == true).toList();

    if (listFiltered.isEmpty) {
      snackbarError(context, "Es necesario seleccionar una pelicula");
      return;
    }

    // List<ChildCountNo> data = [];

    // String currentDate = DateTime.now().millisecondsSinceEpoch.toString();

    // for (var f in listFiltered) {
    //   ChildCountNo element = ChildCountNo(
    //       amount: f.request.amount,
    //       beneficiaryAccountNo: f.user.clabe,
    //       idRequest: f.request.idRequest,
    //       instrId: currentDate,
    //       nmBeneficiary: "${f.user.firstName} ${f.user.lastName}",
    //       postingDate: DateTime.now().toString(),
    //       vendorNo: f.user.supplierNumber);

    //   data.add(element);
    // }

    // PaymentMasive params = PaymentMasive(
    //     childCountNo: data,
    //     credTtm: "",
    //     mesgTxt: currentDate,
    //     remitTorAccountNo: "",
    //     serviceProviderId: "");

    modalButtonsDelete(
      context,
      "!Cuidado!",
      '¿Seguro que deseas eliminar estos registros?',
      "Eliminar",
      () => delete(listFiltered),
      Icons.delete,
    );
  }

  void delete(dynamic request) {
    _movieBloc?.add(DeleteMovieEvent(listIds: request));
    Navigator.of(context).pop();
  }

  void searhRequest(String value) {
    // var listFiltered = listRequest.where((x) => x.request.idRequest == value);

    // if (listFiltered.isNotEmpty) {
    // setState(() {
    // listRequest = listFiltered.toList();
    // });
    // }
  }

  BlocListener listenerMovies() {
    return BlocListener<MovieBloc, MoviesState>(listener: (context, state) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (state is IsLoadingGetAllMoviesByTitleState) {
        // ProgressDialog.show(context);
        // showGeneralLoading(context);
      } else if (state is SuccessGetAllMoviesByTitleState) {
        // ProgressDialog.dissmiss1(context);
        setState(() {
          listRequest = state.responseAll!;
          listRequestTemp = state.responseAll!;
        });
      }
      if (state is ErrorGetAllMoviesByTitleState) {
        // ProgressDialog.dissmiss1(context);
        // snackbarError(context, state.messageError!);
      }
    });
  }

  BlocListener listenerDeleteMovies() {
    return BlocListener<MovieBloc, MoviesState>(listener: (context, state) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (state is IsLoadingDeleteMovie) {
        // ProgressDialog.show(context);
        // showGeneralLoading(context);
      } else if (state is SuccessDeleteMovie) {
        // ProgressDialog.dissmiss(context);
        _movieBloc?.add(const GetAllMoviesByTitleEvent(title: ""));
        // snackbarSuccess(context, "Registros elimanados correctamente");
      }
      if (state is ErrorDeleteMovie) {
        snackbarError(context, state.messageError!);
        // ProgressDialog.dissmiss1(context);
        // Navigator.of(context).pop();

        // snackbarError(context, state.messageError!);
      }
    });
  }
}

class Post {
  final String? title;
  final String? image;
  final String? author;
  final String? date;
  bool selected;

  Post(
      {this.title, this.image, this.author, this.date, required this.selected});
}
