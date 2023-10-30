class Student {
  final String name;
  final int id;
  final String grade;

  Student({
    required this.name,
    required this.id,
    required this.grade,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'class': grade,
        'id': id,
      };

  static Student fromJson(Map<String, dynamic> json) => Student(
        name: json['name'],
        grade: json['class'],
        id: json['id'],
      );
}
