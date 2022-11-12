import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_screen_event.dart';

part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenInitial()) {
    on<MainScreenTriggeredLoadData>(_onLoadedData);
    on<MainScreenPressedItem>(_onPressedItem);
  }

  void _onLoadedData(
    MainScreenTriggeredLoadData event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(MainScreenLoadingState());
    /// imagine here a service getting data
    try {
      await Future.delayed(const Duration(seconds: 3));
      emit(const MainScreenSuccessState(items: ["A", "B", "C", "D"], selectedItem: ""));
    }
    catch(e) {
      emit(MainScreenErrorState(error: e.toString()));
    }
  }

  void _onPressedItem(
      MainScreenPressedItem event,
      Emitter<MainScreenState> emit,
      ){
    var localState = state;
    if(localState is MainScreenSuccessState) {
      emit(localState.copyWith(selectedItem: event.pressedItem));
    }
  }
}
