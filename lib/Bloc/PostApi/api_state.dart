import 'Post.dart';

abstract class PostState {}

class PostInitialState extends PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<Post> posts;
  PostLoadedState(this.posts);
}

class PostErrorState extends PostState {
  final String errorMsg;

  PostErrorState(this.errorMsg);
}







//
// import 'Post.dart';
//
// abstract class ApiState{
//  late final List<Post> posts;
//  late final String errorMsg;
// }
//
// class PostLoadingState extends ApiState{
//   PostLoadingState();
// }
//
// class PostLoadedState extends ApiState{
//   @override
//   final List<Post>posts;
//   PostLoadedState(this.posts);
// }
//
// class PostLoadingErrorState extends ApiState{
//   @override
//   final String errorMsg;
//   PostLoadingErrorState(this.errorMsg);
// }
//






