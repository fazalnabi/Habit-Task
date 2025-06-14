import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa_task/config/AppStyles.dart';
import 'package:shifa_task/config/RoutesName.dart';
import 'package:shifa_task/presentation/pages/widgets/HabitTile.dart';

import '../../domain/entities/HabitEntity.dart';
import '../bloc/habit/habit_bloc.dart';

class HabitHomePage extends StatelessWidget {
  const HabitHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Habit Tracker',
          style: kHeadingStyle.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed:
                () => Navigator.pushNamed(context, RoutesName.searchHabit),
          ),
        ],
      ),
      body: BlocBuilder<HabitBloc, HabitState>(
        builder: (context, state) {
          if (state is HabitLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HabitLoaded) {
            final habits = state.habits;
            if (habits.isEmpty) {
              return const Center(child: Text("No habits yet."));
            }

            final grouped = _groupByStartDate(habits);
            return ListView(
              children:
                  grouped.entries.map((entry) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            entry.key,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        ...entry.value
                            .map((habit) => HabitTile(habit: habit))
                            .toList(),
                      ],
                    );
                  }).toList(),
            );
          } else if (state is HabitError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(
            context,
            RoutesName.addHabit,
          );
          if (result == true) {
            context.read<HabitBloc>().add(LoadHabits());
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Map<String, List<HabitEntity>> _groupByStartDate(List<HabitEntity> habits) {
    final map = <String, List<HabitEntity>>{};
    for (var habit in habits) {
      final dateKey = habit.startDateTime.toLocal().toString().split(' ')[0];
      map[dateKey] = [...(map[dateKey] ?? []), habit];
    }
    return map;
  }
}
