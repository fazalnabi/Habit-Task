import 'package:hive/hive.dart';

import '../models/HabitModel.dart';

class HabitLocalDataSource {
  static late Box<HabitModel> _habitBox;

  static Future<void> init() async {
    _habitBox = await Hive.openBox<HabitModel>('habits');
  }

  static List<HabitModel> getAllHabits() => _habitBox.values.toList();

  static Future<void> addHabit(HabitModel habit) async =>
      await _habitBox.put(habit.id, habit);

  static Future<void> updateHabit(HabitModel habit) async =>
      await _habitBox.put(habit.id, habit);

  static Future<void> deleteHabit(String id) async =>
      await _habitBox.delete(id);

  static List<HabitModel> searchHabits(String query) {
    return _habitBox.values
        .where(
          (habit) =>
              habit.description.toLowerCase().contains(query.toLowerCase()) ||
              habit.durationInMinutes.toString().contains(query),
        )
        .toList();
  }
}
