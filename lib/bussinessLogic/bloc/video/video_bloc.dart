import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';

import '../../../helper/Utils/video_picker_utils.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoPickerUtils videoPickerUtils;
  VideoBloc(this.videoPickerUtils) : super(const VideoState()) {
    on<CameraRecording>(recordVideo);
    on<GalleryVideoPicker>(pickVideoFromGallery);
  }
  void recordVideo(CameraRecording event, Emitter<VideoState> states)async {
     XFile? file = await videoPickerUtils.recordVideo();
     emit(state.copyWith(
       file:file,
     ));

  }

  void pickVideoFromGallery(
      GalleryVideoPicker event, Emitter<VideoState> states)async {
    XFile? file = await videoPickerUtils.pickGalleryVideo();
    emit(state.copyWith(
      file:file,
    ));

  }
}
