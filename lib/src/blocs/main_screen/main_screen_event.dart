part of 'main_screen_bloc.dart';

abstract class MainScreenEvent extends Equatable {
  const MainScreenEvent();
}

class MainScreenTriggeredLoadData extends MainScreenEvent {
  @override
  List<Object?> get props => [];
}

class MainScreenPressedItem extends MainScreenEvent{

  const MainScreenPressedItem({required this.pressedItem});

  final String pressedItem;

  @override
  List<Object?> get props => [pressedItem];

}
