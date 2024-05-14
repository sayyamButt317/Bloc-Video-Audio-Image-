part of 'audio_bloc.dart';

class AudioPlayerState {
  final String? filePath;

  const AudioPlayerState(this.filePath);

  AudioPlayerState copyWith({String? filePath}) {
    return AudioPlayerState(filePath ?? this.filePath);
  }

  List<Object?> get props => [filePath];
}
