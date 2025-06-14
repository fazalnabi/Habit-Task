import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa_task/domain/use_cases/AddHabit.dart';
import 'package:shifa_task/domain/use_cases/DeleteHabit.dart';
import 'package:shifa_task/domain/use_cases/GetAllHabits.dart';
import 'package:shifa_task/domain/use_cases/UpdateHabit.dart';

import '../domain/repositories/HabitRepository.dart';
import '../domain/repositories/HabitRepositoryImpl.dart';
import '../domain/use_cases/SearchHabits.dart';
import '../presentation/bloc/add_habit/add_habit_bloc.dart';
import '../presentation/bloc/habit/habit_bloc.dart';
import '../presentation/bloc/search/search_bloc.dart';
import '../presentation/pages/AddHabitPage.dart';

class BlocProviders {
  static final HabitRepository repository = HabitRepositoryImpl();
  static List<BlocProvider> getBlocs() {
    return [
      BlocProvider<HabitBloc>(
        create:
            (BuildContext context) => HabitBloc(
              getAllHabits: GetAllHabits(repository),
              addHabit: AddHabit(repository),
              updateHabit: UpdateHabit(repository),
              deleteHabit: DeleteHabit(repository),
            )..add(LoadHabits()),
      ),
      BlocProvider(
        create: (context) => AddHabitBloc(habitBloc: context.read<HabitBloc>()),
      ),
      BlocProvider<SearchBloc>(
        create: (context) => SearchBloc(searchHabits: SearchHabits(repository)),
      ),
    ];
  }
}
