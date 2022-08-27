import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_perfect/core/di.dart';
import 'package:pet_perfect/presentation/bloc/random_file_bloc/random_file_bloc.dart';
import 'package:pet_perfect/presentation/screens/posts_screen.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RandomFileBloc _randomFileBloc = injector<RandomFileBloc>();
  late VideoPlayerController _controller;
  Future<void>? _video;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _randomFileBloc..add(GetRandomFile()),
      child: Scaffold(
        body: BlocBuilder<RandomFileBloc, RandomFileState>(
          builder: (context, state) {
            if (state is RandomFileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is RandomFileError) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is RandomFileSuccess) {
              return Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: Builder(builder: (context) {
                    var extention = state.randomFileEntity.url
                        .substring(state.randomFileEntity.url.length - 3);
                    log('Extention: $extention');
                    if (extention == 'mp4') {
                      //Show Video
                      _controller = VideoPlayerController.network(
                          state.randomFileEntity.url);
                      _video = _controller.initialize();
                      return FutureBuilder(
                          future: _video,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          });
                    } else {
                      return CachedNetworkImage(
                        key: UniqueKey(),
                        maxHeightDiskCache: 500,
                        imageUrl: state.randomFileEntity.url.toString(),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => const SizedBox(
                          width: 25,
                          height: 25,
                          child: Image(
                            image: AssetImage('assets/images/placeholder.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                      );

                      // Image(
                      //   image: NetworkImage(state.randomFileEntity.url),
                      //   fit: BoxFit.cover,
                      //   errorBuilder: (b, o, s) {
                      //     return const Center(
                      //       child: Icon(Icons.error),
                      //     );
                      //   },
                      // );
                    }
                  }),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: BlocBuilder<RandomFileBloc, RandomFileState>(
          builder: (context, state) {
            return Visibility(
              visible: state is RandomFileSuccess,
              child: FloatingActionButton(
                onPressed: () {
                  //SAVE THE FILE INTO HIVE
                  // GO TO POSTS SCREEN
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const PostsScreen();
                  }));
                },
                child: const Icon(Icons.save_alt),
              ),
            );
          },
        ),
      ),
    );
  }
}
