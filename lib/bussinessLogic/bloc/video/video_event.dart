part of 'video_bloc.dart';

abstract class VideoEvent  {
  const VideoEvent();

  List<Object> get props => [];
}
class CameraRecording extends VideoEvent {}

class GalleryVideoPicker extends VideoEvent {}
