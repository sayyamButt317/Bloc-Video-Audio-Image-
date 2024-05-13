import 'dart:io';

import 'package:flutter/cupertino.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<VideoBloc, VideoState>(builder: (context, state) {
      if (state.file == null) {
        return InkWell(
            onTap: () {
              context.read<VideoBloc>().add(CameraRecording());
            },
            child: videoPlayerController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(
                      (videoPlayerController),
                    ),
                  )
                : const Center(child: CircularProgressIndicator()));
      } else {
        return Image.file(File(state.file!.path.toString()));
      }
    }));
  }
}
