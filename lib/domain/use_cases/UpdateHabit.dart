import '../entities/HabitEntity.dart';
import '../repositories/HabitRepository.dart';

class UpdateHabit {
  final HabitRepository repository;

  UpdateHabit(this.repository);

  Future<void> call(HabitEntity habit) {
    return repository.updateHabit(habit);
  }
}
