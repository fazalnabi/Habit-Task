import '../data/data_sources/HabitLocalDataSource.dart';
import '../data/models/HabitModel.dart';
import '../entities/HabitEntity.dart';
import 'HabitRepository.dart';

class HabitRepositoryImpl implements HabitRepository {
  @override
  Future<void> addHabit(HabitEntity habit) async {
    final model = HabitModel.fromEntity(habit);
    await HabitLocalDataSource.addHabit(model);
  }

  @override
  Future<void> deleteHabit(String id) async {
    await HabitLocalDataSource.deleteHabit(id);
  }

  @override
  List<HabitEntity> getAllHabits() {
    return HabitLocalDataSource.getAllHabits()
        .map((model) => model.toEntity())
        .toList();
  }

  @override
  Future<void> updateHabit(HabitEntity habit) async {
    final model = HabitModel.fromEntity(habit);
    await HabitLocalDataSource.updateHabit(model);
  }

  @override
  List<HabitEntity> searchHabits(String query) {
    return HabitLocalDataSource.searchHabits(
      query,
    ).map((model) => model.toEntity()).toList();
  }
}
