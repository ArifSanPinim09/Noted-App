// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

class DataModel {
  int? id;
  String title;
  String body;
  DateTime creatAdd;
  Color color;

  DataModel({
    this.id,
    required this.title,
    required this.body,
    required this.creatAdd,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
      'creatAdd': creatAdd.millisecondsSinceEpoch,
      'color': color.value,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] as String,
      body: map['body'] as String,
      creatAdd: DateTime.fromMillisecondsSinceEpoch(map['creatAdd'] as int),
      color: Color(map['color'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) =>
      DataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
