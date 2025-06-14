import 'package:equatable/equatable.dart';

class HabitEntity extends Equatable {
  final String id;
  final String description;
  final DateTime startDateTime;
  final Duration duration;
  final DateTime dateAdded;
  final bool isCompleted;
  final DateTime? completedDate;

  const HabitEntity({
    required this.id,
    required this.description,
    required this.startDateTime,
    required this.duration,
    required this.dateAdded,
    this.isCompleted = false,
    this.completedDate,
  });

  @override
  List<Object?> get props => [
    id,
    description,
    startDateTime,
    duration,
    dateAdded,
    isCompleted,
    completedDate,
  ];

  HabitEntity copyWith({
    String? id,
    String? description,
    DateTime? startDateTime,
    Duration? duration,
    DateTime? dateAdded,
    bool? isCompleted,
    DateTime? completedDate,
  }) {
    return HabitEntity(
      id: id ?? this.id,
      description: description ?? this.description,
      startDateTime: startDateTime ?? this.startDateTime,
      duration: duration ?? this.duration,
      dateAdded: dateAdded ?? this.dateAdded,
      isCompleted: isCompleted ?? this.isCompleted,
      completedDate: completedDate ?? this.completedDate,
    );
  }
}
