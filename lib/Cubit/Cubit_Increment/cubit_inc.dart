import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CubitIncrement extends Cubit<int>{
  CubitIncrement():super(0);
  void cubitIncrement(){
    addError(Exception("increment Error"),StackTrace.current);
   emit(state+1);
  }
  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    print(change);
    super.onChange(change);
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    // print('Error=$error, $stackTrace');
    super.onError(error, stackTrace);
  }

}

class Increment extends StatelessWidget {
CubitIncrement cubitIncrement=CubitIncrement();
Increment({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: cubitIncrement.stream,
      builder: (context, snapshot) {
        return Column(
          children: [
            Text(snapshot.data.toString()),
            MaterialButton(
                child: const Text("Press"),
                onPressed: (){
                cubitIncrement.cubitIncrement();
               }
           ),
          ],
        );
      }
    );
    // return Container();

  }
}

