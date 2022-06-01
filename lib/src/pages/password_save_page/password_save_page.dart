import 'dart:io';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:movie_app/src/pages/home_page/home_page.dart';
import 'package:movie_app/src/pages/login_page/login_page.dart';
import 'package:movie_app/src/utils/constants.dart';
import 'package:movie_app/src/widgets/modals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordSavePage extends StatefulWidget {
  const PasswordSavePage({Key? key}) : super(key: key);

  static String routeName = "password_save_page";

  @override
  State<PasswordSavePage> createState() => _PasswordSavePageState();
}

class _PasswordSavePageState extends State<PasswordSavePage> {
  // Variables

  final LocalAuthentication auth = LocalAuthentication();
  // ignore: unused_field
  _SupportState _supportState = _SupportState.unknown;
  // ignore: unused_field
  bool? _canCheckBiometrics;
  // ignore: unused_field
  List<BiometricType>? _availableBiometrics;
  // ignore: unused_field
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  String? name;
  String? surname;
  String? initials;
  bool dactilar = false;

  @override
  void initState() {
    super.initState();

    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );

    auth.isDeviceSupported().then((bool isSupported) {
      setState(() {
        if (isSupported) {
          print("Device is supported");

          // _authenticate();
          _supportState = _SupportState.supported;
          _getAvailableBiometrics();
        } else {
          print("Device is not supported");
          _supportState = _SupportState.unsupported;
          Navigator.pushReplacementNamed(context, HomePage.routeName);
        }
      });
    });

    initialData();
  }

  void initialData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      dactilar = true;
      name = "Gabriel";
      surname = "Juarez";
      name = getName(name!, surname!);
    });
  }

  signOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    await Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (_) => false);
  }

  // Revisamos si es posible hacer uso del acceso biometrico
  // Future<void> _checkBiometrics() async {
  //   late bool canCheckBiometrics;
  //   try {
  //     canCheckBiometrics = await auth.canCheckBiometrics;
  //   } catch (e) {
  //     canCheckBiometrics = false;
  //     print(e);
  //   }
  //   if (!mounted) {
  //     return;
  //   }

  //   setState(() {
  //     _canCheckBiometrics = canCheckBiometrics;
  //   });
  // }

  // Listado de accesos de tipo biometricos disponibles
  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });

      authenticated = await auth.authenticate(
          localizedReason: 'Accediendo de manera biometrica.',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
      });

      if (authenticated) {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      }
    } catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.toString()}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }

  // Future<void> _authenticateWithBiometrics() async {
  //   bool authenticated = false;
  //   try {
  //     setState(() {
  //       _isAuthenticating = true;
  //       _authorized = 'Authenticating';
  //     });
  //     authenticated = await auth.authenticate(
  //         localizedReason:
  //             'Scan your fingerprint (or face or whatever) to authenticate',
  //         useErrorDialogs: true,
  //         stickyAuth: true,
  //         biometricOnly: true);
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = 'Authenticating';
  //     });
  //   } catch (e) {
  //     print(e);
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = 'Error - ${e.toString()}';
  //     });
  //     return;
  //   }
  //   if (!mounted) {
  //     return;
  //   }

  //   final String message = authenticated ? 'Authorized' : 'Not Authorized';
  //   setState(() {
  //     _authorized = message;
  //   });
  // }

  Future<void> _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  Future<void> _getOs() async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    if (Platform.isIOS) {
      if (availableBiometrics.contains(BiometricType.face)) {
        // Face ID.
      } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
        // Touch ID.
      }
    }

    if (Platform.isAndroid) {
      if (availableBiometrics.contains(BiometricType.face)) {
        // Face ID.
      } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
        // Touch ID.
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.blueGeneric,
        appBar: AppBar(
          centerTitle: true,
          iconTheme:
              const IconThemeData(color: Color.fromARGB(248, 255, 255, 255)),
          title: Container(
            padding: const EdgeInsets.only(left: 16, right: 20),
            alignment: Alignment.center,
            height: 60.0,
            width: 150,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Constants.blueGeneric,
          actions: <Widget>[
            IconButton(
              color: Color.fromARGB(248, 234, 234, 234),
              icon: const Icon(Icons.exit_to_app),
              tooltip: 'Search register',
              onPressed: () {
                modalButtons(
                  context,
                  "Cerrar sesión",
                  "¿Seguro que deseas cerrar sesión?",
                  "Salir",
                  () => signOut(),
                );
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              top: 40,
              bottom: 400,
              left: 24,
              right: 24,
              child: Text(
                // 'Hola Gabriel',
                "¡Hola, $name!",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 24,
                    letterSpacing: 1,
                    color: Color.fromARGB(255, 253, 253, 253),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 24,
              bottom: 270,
              left: 24,
              right: 24,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Lottie.asset(
                  'assets/images/face_id.json',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 150,
              bottom: 0,
              left: 24,
              right: 24,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text(
                  //   'Hola $name',
                  //   textAlign: TextAlign.center,
                  //   style: const TextStyle(
                  //       fontSize: 20,
                  //       letterSpacing: 1,
                  //       color: Color.fromARGB(255, 253, 253, 253),
                  //       fontWeight: FontWeight.bold),
                  // ),

                  // FlatButton(
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10.0),
                  //       side: const BorderSide(color: Colors.black)),
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 15, horizontal: 50),
                  //   child: Text(
                  //     _isAuthenticating ? "Cancelar" : "Acceder",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: responsive.dp(1.8),
                  //     ),
                  //   ),
                  //   onPressed: () {
                  //     if (_isAuthenticating) {
                  //       _cancelAuthentication();
                  //     } else {
                  //       _authenticate();
                  //     }
                  //   },
                  //   color: _isAuthenticating
                  //       ? const Color.fromARGB(255, 154, 22, 22)
                  //       : const Color.fromRGBO(0, 34, 91, 1),
                  // ),
                  MaterialButton(
                    onPressed: () {
                      if (_isAuthenticating) {
                        _cancelAuthentication();
                      } else {
                        _authenticate();
                      }
                    },
                    height: 90,
                    color: _isAuthenticating
                        ? const Color.fromARGB(255, 154, 22, 22)
                        : Color.fromARGB(255, 241, 241, 241),
                    textColor: Colors.white,
                    child: const Icon(
                      Icons.fingerprint,
                      size: 50,
                      color: Colors.black,
                    ),
                    padding: const EdgeInsets.all(16),
                    shape: const CircleBorder(),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  const Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      'Tocar aquí para ingresar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // const Text(
                  //   'Ó',
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     fontSize: 20,
                  //     color: Color(0xff2f3640),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // FlatButton(
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10.0),
                  //       side: const BorderSide(
                  //           color: Color.fromARGB(255, 250, 250, 250))),
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 15, horizontal: 50),
                  //   child: Text(
                  //     "acceso normal",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: responsive.dp(1.8),
                  //     ),
                  //   ),
                  //   onPressed: () {
                  //     // onSubmit(context);
                  //   },
                  //   color: Color.fromARGB(255, 188, 33, 22),
                  // ),
                ],
              ),
            )
          ],
        ));
  }

  String getName(String name, String surname) {
    var first = name.split(" ");
    var second = surname.split(" ");
    return first[0] + " " + second[0];
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
