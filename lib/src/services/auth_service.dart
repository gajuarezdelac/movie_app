import 'package:logger/logger.dart';
import 'package:movie_app/src/database/db_context.dart';
import 'package:movie_app/src/models/params/user_register_params.dart';

class AuthService {
  DBContext context = DBContext();
  final Logger logger = Logger();

  // ** : Servicio para loguearnos
  Future<String> login(String user, String password) async {
    return "";
  }

  // ** : Servicio para registrarnos
  Future<String> register(UserRegisterParams params) async {
    return "";
  }
}
