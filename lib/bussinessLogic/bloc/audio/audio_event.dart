class AudioPlayerEvent {
  const AudioPlayerEvent();
  List<Object> get props => [];
}

class PlayAudioSound extends AudioPlayerEvent {}

class PauseAudioSound extends AudioPlayerEvent {}

class StopAudioSound extends AudioPlayerEvent {}
