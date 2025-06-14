import '../repositories/HabitRepository.dart';

class DeleteHabit {
  final HabitRepository repository;

  DeleteHabit(this.repository);

  Future<void> call(String id) {
    return repository.deleteHabit(id);
  }
}
