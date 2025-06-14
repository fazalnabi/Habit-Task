// File: lib/features/habit_tracker/presentation/pages/add_habit_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa_task/config/AppColors.dart';
import 'package:shifa_task/config/AppStyles.dart';

import '../bloc/add_habit/add_habit_bloc.dart';
import '../bloc/add_habit/add_habit_event.dart';
import '../bloc/add_habit/add_habit_state.dart';

class AddHabitPage extends StatelessWidget {
  AddHabitPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();

  final List<int> _durations = [15, 30, 45, 60, 75];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Habit',
          style: kHeadingStyle.copyWith(color: colorWhite),
        ),
      ),
      body: BlocConsumer<AddHabitBloc, AddHabitState>(
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.pop(context, true);
          }
          if (state.isFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please fill all required fields')),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _descriptionController,
                    style: kNormalTextStyle.copyWith(color: colorGunMetal),
                    decoration: const InputDecoration(
                      labelText: 'Habit Description',
                    ),
                    onChanged: (value) {
                      context.read<AddHabitBloc>().add(
                        DescriptionChanged(value),
                      );
                    },
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Please enter description'
                                : null,
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Select Start Date & Time', style: kTitleStyle),
                    subtitle: Text(
                      state.startDateTime?.toString() ?? 'Not selected',
                      style: kNormalTextStyle,
                    ),
                    trailing: Icon(Icons.calendar_today),
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2030),
                      );
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (time != null) {
                          final selectedDateTime = DateTime(
                            date.year,
                            date.month,
                            date.day,
                            time.hour,
                            time.minute,
                          );
                          context.read<AddHabitBloc>().add(
                            StartDateTimeChanged(selectedDateTime),
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor:
                          Colors.white, // Sets the dropdown background color
                    ),
                    child: DropdownButtonFormField<int>(
                      value: state.durationInMinutes,
                      items:
                          _durations
                              .map(
                                (min) => DropdownMenuItem(
                                  value: min,
                                  child: Text(
                                    '$min minutes',
                                    style: kNormalTextStyle,
                                  ),
                                ),
                              )
                              .toList(),
                      onChanged: (val) {
                        context.read<AddHabitBloc>().add(
                          DurationChanged(val ?? 15),
                        );
                      },
                      decoration: InputDecoration(
                        labelText: 'Duration',
                        labelStyle: kTitleStyle,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AddHabitBloc>().add(SubmitHabit());
                        }
                      },
                      child:
                          state.isSubmitting
                              ? const CircularProgressIndicator()
                              : Text('Save', style: kButtonTextStyle),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
