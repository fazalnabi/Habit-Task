import '../entities/HabitEntity.dart';
import '../repositories/HabitRepository.dart';

class SearchHabits {
  final HabitRepository repository;

  SearchHabits(this.repository);

  List<HabitEntity> call(String query) {
    return repository.searchHabits(query);
  }
}
