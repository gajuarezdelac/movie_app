import 'package:logger/logger.dart';
import 'package:movie_app/src/database/db_context.dart';
import 'package:movie_app/src/models/params/movie_params.dart';
import 'package:movie_app/src/models/response/my_movie.dart';

class MoviesService {
  DBContext context = DBContext();
  final Logger logger = Logger();

  // Buscar todas las peliculas
  Future<List<MyMovie>> getAllMyMovies() async {
    var dbClient = await context.database;

    var res = await dbClient.rawQuery('''SELECT m.* FROM movies AS m''');

    List<MyMovie> list =
        res.isNotEmpty ? res.map((c) => MyMovie.fromJson(c)).toList() : [];
    return list;
  }

  // Buscar pelicula por ID
  Future<List<MyMovie>> getAllMovies(String title) async {
    var dbClient = await context.database;
    var res = await dbClient.rawQuery('''SELECT m.* FROM movies AS m''');

    List<MyMovie> list =
        res.isNotEmpty ? res.map((c) => MyMovie.fromJson(c)).toList() : [];
    return list;
  }

  Future<MyMovie> fetchMovieById(int id) async {
    final dbClient = await context.database;

    var res = await dbClient
        .rawQuery('''SELECT M.* FROM movie AS M WHERE M.id = $id''');

    MyMovie? movie = res.isNotEmpty ? MyMovie.fromJson(res.first) : null;

    return movie!;
  }

// Crear pelicula

  Future<int> creteMovie(MovieParams params) async {
    final dbClient = await context.database;

    var query =
        '''INSERT INTO movies (name, category, author, year) VALUES ('${params.title}', '${params.category}', '${params.author}', 2022)''';

    int result = await dbClient.rawInsert(query);

    return result;
  }

  // Actualizar pelicula
  Future<int> updateMovie(MovieParams params) async {
    final dbClient = await context.database;

    var query = '''
    UPDATE movies SET name = ?, category = ?, author = ? WHERE id = ?
    ''';

    int result = await dbClient.rawUpdate(
        query, [params.title, params.category, params.author, params.id]);

    return result;
  }

  // Eliminar pelicula
  Future<int> deleteMovie(List<MyMovie> listIds) async {
    final dbClient = await context.database;
    var acum = 0;

    var query = '''
       DELETE FROM movies WHERE id = ?
    ''';

    for (var e in listIds) {
      int result = await dbClient.rawDelete(query, [e.id]);
      acum += result;
    }

    return acum;
  }
}
