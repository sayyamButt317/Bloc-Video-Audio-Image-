import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bussinessLogic/bloc/image/image_picker_bloc.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePickerBloc = BlocProvider.of<ImagePickerBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ImagePickerBloc, ImagePickerState>(
              builder: (context, state) {
                if (state.file != null) {
                  return CircleAvatar(
                    radius: 100,
                    backgroundImage: FileImage(File(state.file!.path)),
                  );
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                imagePickerBloc.add(CameraCapture());
              },
              child: const Text('Take a Photo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                imagePickerBloc.add(GalleryImagePicker());
              },
              child: const Text('Choose from Gallery'),
            ),
            const SizedBox(height: 20),
            // Optionally, you can place the 'Continue' button here
          ],
        ),
      ),
    );
  }
}
