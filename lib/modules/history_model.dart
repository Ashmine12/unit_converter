class HistoryModel {
  String unitName;
  String result;
  String date;
  int? id;

  HistoryModel({
    required this.unitName,
    required this.result,
    required this.date,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'unit_name': unitName,
      'result': result,
      'date': date,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> item) => HistoryModel(
        unitName: item["unit_name"],
        result: item["result"].toString(),
        date: item['date'].toString(),
        id: item['id'],
      );
}
