import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'audio_event.dart';
part 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  late AudioPlayer player = AudioPlayer();
  AudioBloc() : super(AudioInitial()) {
    on<PlayAudio>(play);
  }

  Future<void> play(PlayAudio event, Emitter<AudioState> states) async {
    await player.resume();
    emit(state.copyWith(PlayerState.playing));
  }

  Future<void> pause(PauseAudio event, Emitter<AudioState> state) async {
    await player.pause();
    emit(state.copyWith(PlayerState.paused));
  }

  Future<void> stop(StopAudio event, Emitter<AudioState> state) async {
    await player.stop();
    emit(state.copyWith(PlayerState.stopped));
  }
}
