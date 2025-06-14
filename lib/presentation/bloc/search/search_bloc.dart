import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/HabitEntity.dart';
import '../../../domain/use_cases/SearchHabits.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchHabits searchHabits;

  SearchBloc({required this.searchHabits}) : super(SearchInitial()) {
    on<SearchEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<PerformSearch>((event, emit) {
      emit(SearchLoading());
      final results = searchHabits(event.query);
      emit(SearchSuccess(results));
    });
  }
}
