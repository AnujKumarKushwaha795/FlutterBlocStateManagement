import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'dart:math'as math show Random;

class CubitPage extends StatefulWidget {
  const CubitPage({super.key});

  @override
  State<CubitPage> createState() => _CubitPageState();
}
final names=['anuj','sunil','ram','shiva','anil'];
extension RandomElement<T> on Iterable<T>{
  T getRandomElement()=>elementAt(math.Random().nextInt(length));
}

class NamesCubit extends Cubit<String?>{
  // NamesCubit(super.initialState);
  NamesCubit():super(null);
  void pickRandomName()=>emit(names.getRandomElement()); //emit() is a method provided by the Cubit class that is used to emit (or update) a new state.
}


class _CubitPageState extends State<CubitPage> {
  late final NamesCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=NamesCubit(); // initialize cubit
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Cubit"),
      ),
    body:StreamBuilder<String?>(
      stream: cubit.stream,
      builder: (context,snapshot){
        final button=TextButton(onPressed: ()=>cubit.pickRandomName(), child:const Text("Pick Random"));
        switch(snapshot.connectionState){
          case ConnectionState.none:
            return button;
          case ConnectionState.waiting:
            // return const CircularProgressIndicator();
            return button;
          case ConnectionState.active: // when stream is active my snapshot will take data of current stream, and show on UI.
            return Column(
              children: [
              Text(snapshot.data??''),
              button,
                ],
            );
          case ConnectionState.done:
           return  const SizedBox();
        }
      },

    ),
    );
  }
}
