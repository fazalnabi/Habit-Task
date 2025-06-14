import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/AppColors.dart';
import '../../config/AppStyles.dart';
import '../../config/Utils.dart';
import '../../domain/entities/HabitEntity.dart';
import '../bloc/search/search_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Habits',
          style: kHeadingStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search by description...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                context.read<SearchBloc>().add(PerformSearch(query));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchSuccess) {
                  final results = state.results;
                  if (results.isEmpty) {
                    return Center(
                      child: Text('No habits found.', style: kNormalTextStyle),
                    );
                  }
                  return ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final HabitEntity habit = results[index];
                      return Container(
                        margin: EdgeInsets.only(
                          left: 12,
                          right: 12,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: colorGunMetal),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: ListTile(
                          title: Text(habit.description, style: kTitleStyle),
                          subtitle: Text(
                            '${Utils.formatDate(habit.startDateTime)} | ${habit.duration.inMinutes} minutes',
                            style: kHeadingStyle.copyWith(color: colorGunMetal),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: Text(
                    'Start typing to search...',
                    style: kHeadingStyle.copyWith(color: colorGunMetal),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
