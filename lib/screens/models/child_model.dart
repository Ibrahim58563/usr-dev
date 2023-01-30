// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChildModel {
  final String name;
  final String age;
  final String parent;
  ChildModel({
    required this.name,
    required this.age,
    required this.parent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'parent': parent,
    };
  }

  factory ChildModel.fromMap(Map<String, dynamic> map) {
    return ChildModel(
      name: map['name'] as String,
      age: map['age'] as String,
      parent: map['parent'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChildModel.fromJson(String source) => ChildModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
