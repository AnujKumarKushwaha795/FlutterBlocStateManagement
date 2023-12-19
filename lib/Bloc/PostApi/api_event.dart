abstract class PostEvent {}

class FetchPostsEvent extends PostEvent {}


//
// import 'Post.dart';
// abstract class ApiEvent{
//    final List<Post> posts=[];
//    final String errorMsg="";
// }
//
// class PostLoadingEvent extends ApiEvent{}
//
// class PostLoadedEvent extends ApiEvent{
//   @override
//   final List<Post> posts;
//   PostLoadedEvent(this.posts);
// }
//
// class PostLoadingErrorEvent extends ApiEvent{
//   @override
//   final String errorMsg;
//   PostLoadingErrorEvent(this.errorMsg);
// }
