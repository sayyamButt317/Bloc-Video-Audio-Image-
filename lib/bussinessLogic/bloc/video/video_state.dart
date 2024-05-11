part of 'video_bloc.dart';

sealed class VideoState {
  const VideoState();

  List<Object> get props => [];
}

final class VideoInitial extends VideoState {}
