part of 'image_picker_bloc.dart';

abstract class ImagePickerEvent  {
  const ImagePickerEvent();

  List<Object> get props => [];
}

class CameraCapture extends ImagePickerEvent {}

class GalleryImagePicker extends ImagePickerEvent {}
