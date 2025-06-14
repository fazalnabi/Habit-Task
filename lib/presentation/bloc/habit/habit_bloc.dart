import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/HabitEntity.dart';
import '../../../domain/use_cases/AddHabit.dart';
import '../../../domain/use_cases/DeleteHabit.dart';
import '../../../domain/use_cases/GetAllHabits.dart';
import '../../../domain/use_cases/UpdateHabit.dart';

part 'habit_event.dart';
part 'habit_state.dart';

class HabitBloc extends Bloc<HabitEvent, HabitState> {
  final AddHabit addHabit;
  final UpdateHabit updateHabit;
  final DeleteHabit deleteHabit;
  final GetAllHabits getAllHabits;

  HabitBloc({
    required this.addHabit,
    required this.updateHabit,
    required this.deleteHabit,
    required this.getAllHabits,
  }) : super(HabitInitial()) {
    on<LoadHabits>(_onLoadHabits);
    on<AddNewHabit>(_onAddHabit);
    on<UpdateExistingHabit>(_onUpdateHabit);
    on<DeleteExistingHabit>(_onDeleteHabit);
  }

  void _onLoadHabits(LoadHabits event, Emitter<HabitState> emit) {
    emit(HabitLoading());
    try {
      final habits = getAllHabits();
      emit(HabitLoaded(habits));
    } catch (_) {
      emit(HabitError('Failed to load habits.'));
    }
  }

  void _onAddHabit(AddNewHabit event, Emitter<HabitState> emit) async {
    await addHabit(event.habit);
    add(LoadHabits());
  }

  void _onUpdateHabit(
    UpdateExistingHabit event,
    Emitter<HabitState> emit,
  ) async {
    await updateHabit(event.habit);
    add(LoadHabits());
  }

  void _onDeleteHabit(
    DeleteExistingHabit event,
    Emitter<HabitState> emit,
  ) async {
    await deleteHabit(event.id);
    add(LoadHabits());
  }
}
