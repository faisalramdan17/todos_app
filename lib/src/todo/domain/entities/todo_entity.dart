import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
// ignore: must_be_immutable
class TodoEntity extends Equatable {
  @Id(assignable: true)
  int id;
  String task;
  String description;
  bool isCompleted;
  @Property(type: PropertyType.date)
  final DateTime createdAt;

  TodoEntity({
    this.id = 0,
    required this.task,
    required this.description,
    this.isCompleted = false,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        task,
        description,
        isCompleted,
        createdAt,
      ];
}

// ====================


// import 'package:uuid/uuid.dart';
// import 'package:hive/hive.dart';

// // part 'todo_entity.freezed.dart';
// part 'todo_entity.g.dart';

// // @freezedEntity
// @HiveType(typeId: 0)
// class TodoEntity extends HiveObject {
//   static const boxName = "todosBox";

//   TodoEntity({
//     required this.id,
//     required this.task,
//     required this.description,
//     required this.isCompleted,
//     required this.createdAt,
//   });

//   /// ID
//   @HiveField(0)
//   final String id;

//   /// TITLE
//   @HiveField(1)
//   String task;

//   /// SUBTITLE
//   @HiveField(2)
//   String description;

//   /// IS COMPLETED
//   @HiveField(3)
//   bool isCompleted;

//   /// CREATED AT TIME
//   @HiveField(4)
//   DateTime createdAt;

//   /// create new Task
//   factory TodoEntity.create({
//     required String task,
//     required String? description,
//     DateTime? createdAt,
//   }) =>
//       TodoEntity(
//         id: const Uuid().v1(),
//         task: task,
//         description: description ?? "",
//         isCompleted: false,
//         createdAt: createdAt ?? DateTime.now(),
//       );
// }
