import 'package:logger/logger.dart';
import 'package:movie_app/src/database/db_context.dart';

class HistoryService {
  DBContext context = DBContext();
  final Logger logger = Logger();
}
