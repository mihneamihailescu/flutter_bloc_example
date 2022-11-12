import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuff/src/blocs/main_screen/main_screen_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainScreenBloc()..add(MainScreenTriggeredLoadData()),
      child: const MainScreenUI(),
    );
  }
}

class MainScreenUI extends StatelessWidget {
  const MainScreenUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<MainScreenBloc, MainScreenState>(
        listener: (context, state) {
          if (state is MainScreenSuccessState) {
            if(state.selectedItem.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.selectedItem)));
            }
          }
        },
      builder: (context, state) {
            if (state is MainScreenLoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is MainScreenSuccessState) {
              return ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(state.items[index]),
                    ),
                    title: Text(state.items[index]),
                    onTap: () => BlocProvider.of<MainScreenBloc>(context).add(
                        MainScreenPressedItem(pressedItem: state.items[index])),
                  );
                },
              );
            }
            return Container();
          },
        ));
  }
}
