// File: lib/features/habit_tracker/presentation/bloc/add_habit/add_habit_event.dart

import 'package:equatable/equatable.dart';

abstract class AddHabitEvent extends Equatable {
  const AddHabitEvent();

  @override
  List<Object?> get props => [];
}

class DescriptionChanged extends AddHabitEvent {
  final String description;

  const DescriptionChanged(this.description);

  @override
  List<Object?> get props => [description];
}

class StartDateTimeChanged extends AddHabitEvent {
  final DateTime startDateTime;

  const StartDateTimeChanged(this.startDateTime);

  @override
  List<Object?> get props => [startDateTime];
}

class DurationChanged extends AddHabitEvent {
  final int duration;

  const DurationChanged(this.duration);

  @override
  List<Object?> get props => [duration];
}

class SubmitHabit extends AddHabitEvent {}
