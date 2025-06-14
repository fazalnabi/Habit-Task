import '../entities/HabitEntity.dart';
import '../repositories/HabitRepository.dart';

class AddHabit {
  final HabitRepository repository;

  AddHabit(this.repository);

  Future<void> call(HabitEntity habit) {
    return repository.addHabit(habit);
  }
}
