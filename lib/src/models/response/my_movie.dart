class MyMovie {
  MyMovie({
    required this.id,
    required this.name,
    required this.category,
    required this.author,
  });
  late final int id;
  late final String name;
  late final String category;
  late final String author;
  late final int year;
  late bool selected = false;

  MyMovie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    author = json['author'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['category'] = category;
    _data['author'] = author;
    return _data;
  }
}
