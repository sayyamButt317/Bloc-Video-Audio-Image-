import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../bussinessLogic/bloc/video/video_bloc.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({super.key});

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse('https://example.com/placeholder.mp4'))
      ..initialize();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Video Screen"),
      ),
      body: BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {
          if (state.file == null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<VideoBloc>().add(CameraRecording());
                  },
                  child: const Text('Record Fom camera'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<VideoBloc>().add(GalleryVideoPicker());
                  },
                  child: const Text('Pick Video from Gallery'),
                ),
                const SizedBox(height: 16),
                videoPlayerController.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(videoPlayerController),
                      )
                    : Container()
              ],
            );
          } else {
            videoPlayerController =
                VideoPlayerController.file(File(state.file!.path))
                  ..initialize();

            return AspectRatio(
              aspectRatio: videoPlayerController.value.aspectRatio,
              child: VideoPlayer(videoPlayerController),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: BlocBuilder<VideoBloc, VideoState>(
          builder: (context, state) {
            return Icon(
              videoPlayerController.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow,
              color: Colors.white,
            );
          },
        ),
        onPressed: () {
          if (videoPlayerController.value.isPlaying) {
            videoPlayerController.pause();
          } else {
            videoPlayerController.play();
          }
        },
      ),
    );
  }
}
