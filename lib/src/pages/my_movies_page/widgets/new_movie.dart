import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/bloc/bloc.dart';
import 'package:movie_app/src/models/params/movie_params.dart';
import 'package:movie_app/src/pages/login_page/login_page.dart';
import 'package:movie_app/src/utils/constants.dart';
import 'package:movie_app/src/utils/dialogs.dart';
import 'package:movie_app/src/widgets/header_widget.dart';
import 'package:movie_app/src/widgets/snackbars.dart';
import 'package:movie_app/src/widgets/theme_helper.dart';

class NewMovie extends StatefulWidget {
  const NewMovie({Key? key}) : super(key: key);

  @override
  State<NewMovie> createState() => _NewMovieState();
}

class _NewMovieState extends State<NewMovie> {
  MovieBloc? _movieBloc;

  final _formKey = GlobalKey<FormState>();
  final double _headerHeight = 250;

  TextEditingController titleText = TextEditingController();
  TextEditingController categoryText = TextEditingController();
  TextEditingController descriptionText = TextEditingController();

  final textFieldColor = const Color.fromARGB(255, 225, 227, 230);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleText.dispose();
    categoryText.dispose();
    descriptionText.dispose();
    super.dispose();
  }

  signOut() async {
    await Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (_) => false);
  }

  void initialData() async {
    _movieBloc = BlocProvider.of<MovieBloc>(context);

    // _movieBloc?.add(CreateMovieEvent(
    //     params: MovieParams(
    //         id: 1,
    //         title: "Primer titul",
    //         category: "Primer titul",
    //         author: "Primer titul")));
  }

  @override
  void initState() {
    initialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            children: const [
              Text(
                "Nueva ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              Text(
                "Pelicula",
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 225, 44, 16),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // if (!regExp.hasMatch(userText.text.trim())) {
            //   snackbarRoundInfo(context, "No es un email valido!",
            //       Color.fromARGB(255, 235, 132, 7));
            //   validate = false;
            // }
            _movieBloc?.add(CreateMovieEvent(
                params: MovieParams(
                    id: 0,
                    title: titleText.text,
                    category: categoryText.text,
                    author: descriptionText.text)));

            print("Formulario valido");

            // Navigator.pushReplacementNamed(context, PasswordSavePage.routeName);

          }

          // Respond to button press
        },
        child: const Icon(Icons.save),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: MultiBlocListener(
          listeners: [
            createMovieListener(),
          ],
          child: SingleChildScrollView(
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
                SafeArea(
                  child: FittedBox(
                    child: Container(
                      // height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(kFixPadding),
                      padding: const EdgeInsets.all(kFixPadding),
                      decoration: BoxDecoration(
                          color: kWhiteColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: const [
                            BoxShadow(color: kLightColor, blurRadius: 2.0)
                          ]),
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    // Icon(Icons.home),
                                    SizedBox(width: 6.0),
                                    Text("Datos de la pelicula",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: titleText,
                                    decoration: ThemeHelper()
                                        .textInputDecoration(
                                            Icons.title,
                                            'Titulo',
                                            'Escribe el titulo de la pelicula'),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Campo requerido";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: categoryText,
                                    decoration: ThemeHelper()
                                        .textInputDecoration(
                                            Icons.category,
                                            'Categoria',
                                            'Selecciona una categoria'),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Campo requerido";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                const SizedBox(height: 20.0),
                                Container(
                                  child: TextFormField(
                                    controller: descriptionText,
                                    minLines:
                                        3, // any number you need (It works as the rows for the textarea)
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration:
                                        ThemeHelper().textInputDecoration(
                                      Icons.description,
                                      'Descripción',
                                      'Describe la pelicula',
                                    ),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Campo requerido";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                const Text(
                                    "* Es necesario llenar todos los campos.",
                                    style: TextStyle(color: kLightColor)),
                                const SizedBox(height: 60.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocListener createMovieListener() {
    return BlocListener<MovieBloc, MoviesState>(listener: (context, state) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (state is IsLoadingCreateMovie) {
        ProgressDialog.show(context);
        // showGeneralLoading(context);
      } else if (state is SuccessCreateMovie) {
        ProgressDialog.dissmiss1(context);
        snackbarSuccess(context, "Agregada correctamente");
        _movieBloc?.add(const GetAllMoviesByTitleEvent(title: ""));

        Navigator.pop(context);
      }
      if (state is ErrorCreateMovie) {
        ProgressDialog.dissmiss1(context);
        // snackbarError(context, state.messageError!);
      }
    });
  }
}
