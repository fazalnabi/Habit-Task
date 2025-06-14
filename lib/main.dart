import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:shifa_task/config/CustomTheme.dart';
import 'package:sizer/sizer.dart';
import 'package:shifa_task/config/AppColors.dart';
import 'package:shifa_task/config/BlocProviders.dart';
import 'package:shifa_task/config/RoutesName.dart';
import 'package:shifa_task/config/routes.dart';

import 'domain/data/data_sources/HabitLocalDataSource.dart';
import 'domain/data/models/HabitModel.dart';
import 'package:hive_flutter/hive_flutter.dart';

final getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HabitModelAdapter());

  await HabitLocalDataSource.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: BlocProviders.getBlocs(),
          child: MaterialApp(
            title: 'Shifa Hospital',
            debugShowCheckedModeBanner: false,
            theme: light,
            onGenerateRoute: Routes.onGenerateRoute,
            initialRoute: RoutesName.homeScreen,
          ),
        );
      },
    );
  }
}
