import 'package:flutter/material.dart';
import 'package:movie_app/src/pages/history_page/history_page.dart';

import 'package:movie_app/src/pages/home_page/home_page.dart';
import 'package:movie_app/src/pages/login_page/login_page.dart';
import 'package:movie_app/src/pages/notification_page/notification_page.dart';
import 'package:movie_app/src/pages/password_save_page/password_save_page.dart';
import 'package:movie_app/src/pages/register_page/reigster_page.dart';
import 'package:movie_app/src/pages/splash_page/splash_page.dart';
import 'package:movie_app/src/pages/user_profile_page.dart/user_profile_page.dart';
import 'package:movie_app/src/pages/view_movie_page/view_movie_page.dart';
import 'package:movie_app/src/pages/welcome_page/welcome_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    HomePage.routeName: (BuildContext context) => const HomePage(),
    SplashPage.routeName: (BuildContext context) => const SplashPage(),
    UserProfilePage.routeName: (BuildContext context) =>
        const UserProfilePage(),
    RegisterPage.routeName: (BuildContext context) => const RegisterPage(),
    NotificationPage.routeName: (BuildContext context) =>
        const NotificationPage(),
    HistoryPage.routeName: (BuildContext context) => const HistoryPage(),
    PasswordSavePage.routeName: (BuildContext context) =>
        const PasswordSavePage(),
    LoginPage.routeName: (BuildContext context) => const LoginPage(),
    WelcomePage.routeName: (BuildContext context) => const WelcomePage(),
    ViewMoviePage.routeName: (BuildContext context) => const ViewMoviePage(),
  };
}
