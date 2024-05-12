import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bussinessLogic/bloc/video/video_bloc.dart';

class VideoPlayerView extends StatelessWidget {
  const VideoPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocBuilder<VideoBloc,VideoState>(
        builder:(context,state){

        }
      )
    );
  }
}
