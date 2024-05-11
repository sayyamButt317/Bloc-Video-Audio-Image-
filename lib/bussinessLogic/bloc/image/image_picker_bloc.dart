import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import '../../../helper/Utils/image_picker_utils.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(cameraCapture);
    on<GalleryImagePicker>(galleryPicker);
  }

  void cameraCapture(
      CameraCapture event, Emitter<ImagePickerState> states) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(
      file: file,
    ));
  }

  void galleryPicker(
      GalleryImagePicker event, Emitter<ImagePickerState> states) async {
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(
      file: file,
    ));
  }
}
