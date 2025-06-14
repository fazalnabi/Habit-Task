part of 'habit_bloc.dart';

@immutable
sealed class HabitEvent {}

class LoadHabits extends HabitEvent {}

class AddNewHabit extends HabitEvent {
  final HabitEntity habit;

  AddNewHabit(this.habit);
}

class UpdateExistingHabit extends HabitEvent {
  final HabitEntity habit;

  UpdateExistingHabit(this.habit);
}

class DeleteExistingHabit extends HabitEvent {
  final String id;

  DeleteExistingHabit(this.id);
}
