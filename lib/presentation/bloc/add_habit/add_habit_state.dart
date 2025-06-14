// File: lib/features/habit_tracker/presentation/bloc/add_habit/add_habit_state.dart

import 'package:equatable/equatable.dart';

class AddHabitState extends Equatable {
  final String description;
  final DateTime? startDateTime;
  final int durationInMinutes;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  const AddHabitState({
    required this.description,
    required this.startDateTime,
    required this.durationInMinutes,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
  });

  factory AddHabitState.initial() => const AddHabitState(
    description: '',
    startDateTime: null,
    durationInMinutes: 15,
    isSubmitting: false,
    isSuccess: false,
    isFailure: false,
  );

  AddHabitState copyWith({
    String? description,
    DateTime? startDateTime,
    int? durationInMinutes,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return AddHabitState(
      description: description ?? this.description,
      startDateTime: startDateTime ?? this.startDateTime,
      durationInMinutes: durationInMinutes ?? this.durationInMinutes,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  List<Object?> get props => [
    description,
    startDateTime,
    durationInMinutes,
    isSubmitting,
    isSuccess,
    isFailure,
  ];
}
