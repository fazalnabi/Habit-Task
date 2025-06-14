part of 'habit_bloc.dart';

@immutable
sealed class HabitState {}

final class HabitInitial extends HabitState {}

class HabitLoading extends HabitState {}

class HabitLoaded extends HabitState {
  final List<HabitEntity> habits;

  HabitLoaded(this.habits);
}

class HabitError extends HabitState {
  final String message;

  HabitError(this.message);
}
