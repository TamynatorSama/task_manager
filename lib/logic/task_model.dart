const String tableName = "Taskmanager";

class Task {
  final int? id;
  final String title;
  final DateTime begin;
  final DateTime end;
  final String description;
  final String color;
  final String? illustration;

  Task(
      {this.id,
      required this.title,
      required this.begin,
      required this.end,
      required this.description,
      required this.color,
      this.illustration});

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "begin": begin,
        "end": end,
        "description": description,
        "color" : color,
        "illustration" : illustration
      };
}
