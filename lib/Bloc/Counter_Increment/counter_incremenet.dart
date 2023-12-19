import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define CounterEvent
abstract class CounterEvent {}

class CounterPressed extends CounterEvent {}

// Define CounterBloc
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterPressed>((event, emit) {
      emit(state + 1);
    });
  }
}

// Define CounterBlocUI
class CounterBlocUI extends StatelessWidget {
  const CounterBlocUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(), // Provide CounterBloc instance
      child: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter BLoC Example'),
      ),
      body: BlocConsumer<CounterBloc, int>(
        listener: (context, count) {
          // Listener for state changes (optional)
          // You can perform actions based on state changes here
        },
        builder: (context, count) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Counter Value:',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '$count',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),

      // body: BlocBuilder<CounterBloc, int>(
      //   builder: (context, count) {
      //     return Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             'Counter Value:',
      //             style: TextStyle(fontSize: 20),
      //           ),
      //           Text(
      //             '$count',
      //             style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Dispatch CounterPressed event when FAB is pressed
          context.read<CounterBloc>().add(CounterPressed());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
//
// void main() {
//   runApp(MaterialApp(
//     home: CounterBlocUI(),
//   ));
// }
