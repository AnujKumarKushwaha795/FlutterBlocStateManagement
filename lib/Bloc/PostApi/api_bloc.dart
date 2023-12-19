import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:block_state_management/main.dart';

import 'Post.dart';
import 'api_event.dart';
import 'api_repository.dart';
import 'api_state.dart'; // Replace with your correct import path

class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiRepository apiRepository;

  PostBloc({required this.apiRepository}) : super(PostInitialState()){
    on<FetchPostsEvent>((event, emit)async {
      try {
        List<Post>posts = await apiRepository.getPostsList();
        // log("List of posts from bloc page==$posts");
        emit(PostLoadedState(posts));
      } catch (e) {
        // log("error in bloc page");
        emit(PostErrorState(e.toString()));
      }
    });


  }

  // @override
  // Stream<PostState> mapEventToState(PostEvent event) async* {
  //   if (event is FetchPostsEvent) {
  //     // yield PostLoadingState();
  //     try {
  //       final posts = await apiRepository.getPostsList();
  //       log("List of posts=$posts");
  //       yield PostLoadedState(posts);
  //     } catch (e) {
  //       yield PostErrorState('Failed to load posts');
  //     }
  //   }
  // }

}

