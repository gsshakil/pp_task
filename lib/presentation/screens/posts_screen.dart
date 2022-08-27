import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_perfect/core/di.dart';
import 'package:pet_perfect/domain/use_cases/get_post_use_case.dart';
import 'package:pet_perfect/presentation/bloc/post_bloc/post_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final PostBloc _postBloc = injector<PostBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocProvider.value(
        value: _postBloc..add(GetPosts()),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostError) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is PostSuccess) {
              return ListView.builder(
                  itemCount: state.postEntity.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.postEntity[index]!.title,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(state.postEntity[index]!.body),
                            ]),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
