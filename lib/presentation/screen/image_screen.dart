import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:msb_task4/bussinessLogic/bloc/image/image_picker_bloc.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
        builder: (context, state) {
      if (state.file == null) {
        return InkWell(
            onTap: () {
              context.read<ImagePickerBloc>().add(CameraCapture());
            },
            child: const CircleAvatar(
              child: Icon(
                LineIcons.camera,
              ),
            ));
      } else {
        return Image.file(File(state.file!.path.toString()));
      }
    }));
  }
}
