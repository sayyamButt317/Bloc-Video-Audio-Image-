part of 'image_picker_bloc.dart';

class ImagePickerState {
  final XFile? file;
  const ImagePickerState({this.file});

  ImagePickerState copyWith({XFile? file}) {
    return ImagePickerState(file: file ?? this.file);
  }

  List<Object?> get props => [file];
}
