// File: lib/features/habit_tracker/presentation/bloc/add_habit/add_habit_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/entities/HabitEntity.dart';
import '../habit/habit_bloc.dart';
import 'add_habit_event.dart';
import 'add_habit_state.dart';

class AddHabitBloc extends Bloc<AddHabitEvent, AddHabitState> {
  final HabitBloc habitBloc;

  AddHabitBloc({required this.habitBloc}) : super(AddHabitState.initial()) {
    on<DescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<StartDateTimeChanged>((event, emit) {
      emit(state.copyWith(startDateTime: event.startDateTime));
    });

    on<DurationChanged>((event, emit) {
      emit(state.copyWith(durationInMinutes: event.duration));
    });

    on<SubmitHabit>((event, emit) {
      if (state.description.isEmpty || state.startDateTime == null) {
        emit(state.copyWith(isFailure: true));
        return;
      }

      emit(state.copyWith(isSubmitting: true));

      final habit = HabitEntity(
        id: const Uuid().v4(),
        description: state.description,
        startDateTime: state.startDateTime!,
        duration: Duration(minutes: state.durationInMinutes),
        dateAdded: DateTime.now(),
        isCompleted: false,
        completedDate: null,
      );

      habitBloc.add(AddNewHabit(habit));

      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    });
  }
}
