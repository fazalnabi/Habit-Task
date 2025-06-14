import '../entities/HabitEntity.dart';

abstract class HabitRepository {
  Future<void> addHabit(HabitEntity habit);
  Future<void> updateHabit(HabitEntity habit);
  Future<void> deleteHabit(String id);
  List<HabitEntity> getAllHabits();
  List<HabitEntity> searchHabits(String query);
}
