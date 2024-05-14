import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msb_task4/bussinessLogic/bloc/audio/audio_bloc.dart';
import 'package:msb_task4/bussinessLogic/bloc/audio/audio_event.dart';
import 'package:msb_task4/helper/enum/audioplayer_enum.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio Player')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<AudioBloc, AudioPlayerState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (state == AudioEnumState.playing)
                      IconButton(
                        icon: const Icon(Icons.pause),
                        onPressed: () =>
                            context.read<AudioBloc>().add(PauseAudioSound()),
                      ),
                    if (state != AudioEnumState.playing)
                      IconButton(
                        icon: const Icon(Icons.play_arrow),
                        onPressed: () =>
                            context.read<AudioBloc>().add(PlayAudioSound()),
                      ),
                    IconButton(
                      icon: const Icon(Icons.stop),
                      onPressed: () =>
                          context.read<AudioBloc>().add(StopAudioSound()),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
