import 'dart:developer';

import 'package:block_state_management/Bloc/Counter_Increment/counter_incremenet.dart';
import 'package:block_state_management/Bloc/PostApi/Post.dart';
import 'package:block_state_management/Bloc/PostApi/api_bloc.dart';
import 'package:block_state_management/Bloc/PostApi/api_repository.dart';
import 'package:block_state_management/Bloc/PostApi/data_service.dart';
import 'package:block_state_management/Bloc/PostApi/post_list_page.dart';
import 'package:block_state_management/Cubit/Cubit_Increment/cubit_inc.dart';
import 'package:block_state_management/Cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<Post>post = [];
DataService dataService = DataService();
ApiRepository apiRepository = ApiRepository(dataService: dataService);
void main() async {

  // post = await apiRepository.getPostsList();
  // log(post[0].id.toString());
  // log(post[0].title.toString());
  // log(post[0].url.toString());
  // log(post[0].thumbnailUrl.toString());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Block(),
      // home: CubitPage(),
      // home:Increment(),
      // home:CounterBlocUI(),
      home: BlocProvider(
        create: (context) => PostBloc(apiRepository: apiRepository),
        child: PostListWidget(),
      ),
    );
  }
}
