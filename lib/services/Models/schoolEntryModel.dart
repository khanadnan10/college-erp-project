class SchoolEntryModel {
  final String id;
  final String school;
  final String state;
  final String zone;
  final String team;
  final String schoolType;
  final String city;
  final String area;
  final String staffName;

  SchoolEntryModel({
    this.id = '',
    required this.school,
    required this.state,
    required this.zone,
    required this.team,
    required this.schoolType,
    required this.city,
    required this.area,
    required this.staffName,
  });

  Map<String, String> toJson() => {
        'id': id,
        'school': school,
        'state': state,
        'zone': zone,
        'team': team,
        'schoolType': schoolType,
        'city': city,
        'area': area,
        'staffName': staffName,
      };

  static SchoolEntryModel fromJson(Map<String, dynamic> json) =>
      SchoolEntryModel(
        id: json['id'],
        school: json['school'],
        state: json['state'],
        zone: json['zone'],
        team: json['team'],
        schoolType: json['schoolType'],
        city: json['city'],
        area: json['area'],
        staffName: json['staffName'],
      );
}
