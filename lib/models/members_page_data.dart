import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_quill/flutter_quill.dart';

class MemberPageData extends Equatable {
  final String id;
  final String name;
  final String email;
  final String owner;

  const MemberPageData({
    required this.id,
    required this.name,
    required this.email,
    required this.owner
  });

  Map<String, dynamic> toMap() {
    return {
      '\$id': id,
      'name': name,
      'email': email,
    };
  }

  factory MemberPageData.fromMap(Map<String, dynamic> map) {
    // final contentJson =
    //     (map['content'] == null) ? [] : jsonDecode(map['content']);
    return MemberPageData(
      id: map['\$id'],
      name: map['name'] ?? '',
      email:map['email'],
      owner: map['owner'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberPageData.fromJson(String source) =>
      MemberPageData.fromMap(json.decode(source));

  @override
  List<Object?> get props => [name, email];

  MemberPageData copyWith({
    String? id,
    String? name,
    String? email,
    String? owner,
  }) {
    return MemberPageData(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      owner: owner ?? this.owner,
    );
  }
}