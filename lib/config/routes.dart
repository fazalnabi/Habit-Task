import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa_task/config/RoutesName.dart';
import 'package:shifa_task/presentation/pages/AddHabitPage.dart';
import 'package:shifa_task/presentation/pages/HabitHomePage.dart';

import '../presentation/bloc/add_habit/add_habit_bloc.dart';
import '../presentation/bloc/habit/habit_bloc.dart';
import '../presentation/pages/SearchPage.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HabitHomePage());
      case RoutesName.addHabit:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider<AddHabitBloc>(
              create: (_) => AddHabitBloc(habitBloc: context.read<HabitBloc>()),
              child: AddHabitPage(),
            );
          },
        );
      case RoutesName.searchHabit:
        return MaterialPageRoute(builder: (_) => const SearchPage());
    }
  }
}
