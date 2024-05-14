import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msb_task4/bussinessLogic/bloc/audio/audio_event.dart';

part 'audio_state.dart';

class AudioBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  final player = AudioPlayer();

  AudioBloc() : super(const AudioPlayerState(null)) {
    on<PlayAudioSound>(playSound);
    on<PauseAudioSound>(pausesound);
    on<StopAudioSound>(stopsound);
  }

  Future<void> playSound(
      PlayAudioSound event, Emitter<AudioPlayerState> states) async {
    String soundPath = "audio/song.mp3";
    await player.play(AssetSource(soundPath));
  }

  Future<void> pausesound(
      PauseAudioSound event, Emitter<AudioPlayerState> states) async {
    await player.pause();
  }

  Future<void> stopsound(
      StopAudioSound event, Emitter<AudioPlayerState> states) async {
    await player.stop();
  }
}
