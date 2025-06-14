import 'package:hive/hive.dart';

import '../../entities/HabitEntity.dart';

part 'HabitModel.g.dart';

@HiveType(typeId: 0)
class HabitModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final DateTime startDateTime;

  @HiveField(3)
  final int durationInMinutes;

  @HiveField(4)
  final DateTime dateAdded;

  @HiveField(5)
  final bool isCompleted;

  @HiveField(6)
  final DateTime? completedDate;

  HabitModel({
    required this.id,
    required this.description,
    required this.startDateTime,
    required this.durationInMinutes,
    required this.dateAdded,
    this.isCompleted = false,
    this.completedDate,
  });

  factory HabitModel.fromEntity(HabitEntity entity) => HabitModel(
    id: entity.id,
    description: entity.description,
    startDateTime: entity.startDateTime,
    durationInMinutes: entity.duration.inMinutes,
    dateAdded: entity.dateAdded,
    isCompleted: entity.isCompleted,
    completedDate: entity.completedDate,
  );

  HabitEntity toEntity() => HabitEntity(
    id: id,
    description: description,
    startDateTime: startDateTime,
    duration: Duration(minutes: durationInMinutes),
    dateAdded: dateAdded,
    isCompleted: isCompleted,
    completedDate: completedDate,
  );
}
