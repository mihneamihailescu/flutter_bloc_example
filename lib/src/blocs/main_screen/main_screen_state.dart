part of 'main_screen_bloc.dart';

abstract class MainScreenState extends Equatable {
  const MainScreenState();
}

class MainScreenInitial extends MainScreenState {
  @override
  List<Object> get props => [];
}

class MainScreenLoadingState extends MainScreenState {
  @override
  List<Object> get props => [];
}

class MainScreenSuccessState extends MainScreenState {
  const MainScreenSuccessState(
      {required this.items, required this.selectedItem});

  final List<String> items;
  final String selectedItem;

  MainScreenSuccessState copyWith({
    List<String>? items,
    String? selectedItem,
  }) {
    return MainScreenSuccessState(
      items: items ?? this.items,
      selectedItem: selectedItem ?? this.selectedItem,
    );
  }

  @override
  List<Object> get props => [items, selectedItem];
}

class MainScreenErrorState extends MainScreenState {
  const MainScreenErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}
