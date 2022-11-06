class StudentEntryModel {
  final String id;
  final String name;
  final String mobile;
  final String school;
  final String state;
  final String city;
  final String stream;

  StudentEntryModel({
    this.id = "",
    required this.name,
    required this.mobile,
    required this.school,
    required this.state,
    required this.city,
    required this.stream,
  });

  Map<String, String> toJson() => {
        'id': id,
        'name': name,
        'mobile': mobile,
        'school': school,
        'state': state,
        'city': city,
        'stream': stream,
      };

  static StudentEntryModel fromJson(Map<String, dynamic> json) =>
      StudentEntryModel(
        id: json['id'],
        name: json['name'],
        mobile: json['mobile'],
        school: json['school'],
        state: json['state'],
        city: json['city'],
        stream: json['stream'],
      );
}
