part of 'video_bloc.dart';

class VideoState {
  final XFile? file;
  const VideoState({this.file});

  VideoState copyWith({XFile? file}) {
    return VideoState(file: file ?? this.file);
  }

  List<Object?> get props => [file];
}
