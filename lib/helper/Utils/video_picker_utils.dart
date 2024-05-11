import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VideoPickerUtils {
  final ImagePicker _videopicker = ImagePicker();

  Future<XFile?> recordVideo() async {
    final XFile? videofile = await _videopicker.pickVideo(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        maxDuration: const Duration(minutes: 10));
    return (videofile);
  }

  Future<XFile?> pickGalleryVideo() async {
    final XFile? videofile =
        await _videopicker.pickVideo(source: ImageSource.gallery);
    return (videofile);
  }

  void showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  pickGalleryVideo();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  recordVideo();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
