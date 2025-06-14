import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:shifa_task/config/AppColors.dart';

import '../../../config/AppStyles.dart';
import '../../../domain/entities/HabitEntity.dart';
import '../../bloc/habit/habit_bloc.dart';

class HabitTile extends StatelessWidget {
  final HabitEntity habit;

  const HabitTile({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: colorGunMetal),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: ListTile(
        title: Text(habit.description, style: kTitleStyle),
        subtitle: Text(
          'Duration: ${habit.duration.inMinutes} mins\nStatus: ${habit.isCompleted ? 'Completed' : 'Not Completed'}',
          style: kNormalTextStyle,
        ),
        trailing: IconButton(
          icon: Icon(
            habit.isCompleted
                ? Icons.check_circle
                : Icons.radio_button_unchecked,
            color: habit.isCompleted ? Colors.green : Colors.grey,
          ),
          onPressed: () {
            final updated = habit.copyWith(
              isCompleted: !habit.isCompleted,
              completedDate: !habit.isCompleted ? DateTime.now() : null,
            );
            context.read<HabitBloc>().add(UpdateExistingHabit(updated));
          },
        ),
      ),
    );
  }
}
