class StudentsModel {
  final String id;
  final String name;
  final String enrollmentNumber;
  final String branch;

  StudentsModel({
    this.id = "",
    required this.name,
    required this.enrollmentNumber,
    required this.branch,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'enrollmentNumber': enrollmentNumber,
        'branch': branch,
      };

  // FromJson Convertion
  static StudentsModel fromJson(Map<String, dynamic> json) => StudentsModel(
        id: json['id'], 
        name: json['name'],
        enrollmentNumber: json['enrollmentNumber'],
        branch: json['branch'],
      );
}
