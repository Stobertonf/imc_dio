class ImcSQLiteModel {
  int? id;
  String height;
  String weight;

  ImcSQLiteModel({this.id, required this.height, required this.weight});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'height': height,
      'weight': weight,
    };
  }
}
