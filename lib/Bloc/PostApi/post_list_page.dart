import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Post.dart';
import 'api_bloc.dart';
import 'api_event.dart';
import 'api_state.dart'; // Replace with your correct import path

class PostListWidget extends StatelessWidget {
  const PostListWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostInitialState) {
            return const Center(child: Text('No posts yet,click on refresh button'));
          }
          else if (state is PostLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is PostLoadedState) {
            // log(state.posts.length.toString());
            // log(state.posts.toString());
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                Post post = state.posts[index];
                return ListTile(
                  title: Text(post.id.toString()),
                  subtitle: Text(post.title??''),
                  leading: Container(
                    height: 35,
                      width: 35,
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(17),
                    ),
                      child: Image.network(post.url.toString(),fit: BoxFit.fill,),
                  ),
                  trailing: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.network(post.thumbnailUrl.toString(),fit: BoxFit.fill,),
                  ),
                  onTap: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: const Text("Full image"),
                        content:Container(
                          // height: 100,
                          // width: 100,
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Image.network(post.url.toString(),fit: BoxFit.fill,),
                        ),
                      );
                    });
                  },
                  // shape:ShapeBorder.lerp(LinearBorder(), LinearBorder(), 5.0),
                  // selectedColor: Colors.green,
                  // focusColor: Colors.blue,
                  // Display other details if needed
                );
              },
            );
          }
          else if (state is PostErrorState) {
            return Center(child: Text('Error: ${state.errorMsg}'));
          } else {
            return const Center(child: Text('Unknown state occurred.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postBloc.add(FetchPostsEvent());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}


