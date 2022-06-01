class MovieParams {
  MovieParams({
    required this.id,
    required this.title,
    required this.category,
    required this.author,
  });
  late final int id;
  late final String title;
  late final String category;
  late final String author;

  MovieParams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    category = json['category'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['category'] = category;
    _data['author'] = author;
    return _data;
  }
}
