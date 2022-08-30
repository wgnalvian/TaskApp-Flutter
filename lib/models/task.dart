// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Task extends Equatable {
  final String title;
  String? id;
  bool? isDone;
  bool? isFav;
  bool? isExpand;
  bool? isDelete;
  Task({
    required this.title,
    this.id,
    this.isDone,
    this.isFav,
    this.isDelete,
    this.isExpand,
  }) {
    var uuid = Uuid();
    id = id ?? uuid.v4();
    isFav = isFav ?? false;
    isExpand = isExpand ?? false;
    isDone = isDone ?? false;
    isDelete = isDelete ?? false;
  }

  Task copyWith(
      {String? title,
      String? id,
      bool? isDone,
      bool? isExpand,
      bool? isDelete,
      bool? isFav}) {
    return Task(
      title: title ?? this.title,
      id: id ?? this.id,
      isFav: isFav ?? this.isFav,
      isExpand: isExpand ?? this.isExpand,
      isDone: isDone ?? this.isDone,
      isDelete: isDelete ?? this.isDelete,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'isDone': isDone,
      'isDelete': isDelete,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDelete: map['isDelete'] != null ? map['isDelete'] as bool : null,
    );
  }

  @override
  List<Object?> get props => [id, title, isDone, isExpand, isDelete, isFav];
}
