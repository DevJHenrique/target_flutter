// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Note {
  int id;
  String description;

  Note(
    this.id,
    this.description,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      map['id'] as int,
      map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => toJson();
}
