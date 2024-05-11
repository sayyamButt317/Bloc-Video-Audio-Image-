part of 'audio_bloc.dart';

sealed class AudioState {
  const AudioState();

  List<Object> get props => [];
}

final class AudioInitial extends AudioState {}
