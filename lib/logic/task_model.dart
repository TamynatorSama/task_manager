
const String tableName = "Taskmanager";

class Task {
  final int? id;
  final String title;
  final String begin;
  final String end;
  final String description;
  final String color;

  Task(
      {this.id,
      required this.title,
      required this.begin,
      required this.end,
      required this.description,
      required this.color});

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "begin": begin,
        "end": end,
        "description": description,
        "color": color,
      };
   factory Task.fromJson(Map<String,dynamic>json)=>Task(
    id: json["id"] ,
    title: json["title"],
    begin: json["begin"],
    end: json["end"],
    description: json["description"],
    color: json["color"]
  );
}
