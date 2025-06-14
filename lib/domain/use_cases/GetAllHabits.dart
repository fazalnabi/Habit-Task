import '../entities/HabitEntity.dart';
import '../repositories/HabitRepository.dart';

class GetAllHabits {
  final HabitRepository repository;

  GetAllHabits(this.repository);

  List<HabitEntity> call() {
    return repository.getAllHabits();
  }
}
