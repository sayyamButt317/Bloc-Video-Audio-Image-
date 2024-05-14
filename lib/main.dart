import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msb_task4/bussinessLogic/bloc/audio/audio_bloc.dart';
import 'package:msb_task4/bussinessLogic/bloc/image/image_picker_bloc.dart';
import 'package:msb_task4/bussinessLogic/bloc/video/video_bloc.dart';
import 'package:msb_task4/helper/Utils/video_picker_utils.dart';

import 'widget/appdrawer.dart';
import 'helper/Utils/http.dart';
import 'helper/Utils/image_picker_utils.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
          BlocProvider(create: (_) => VideoBloc(VideoPickerUtils())),
          BlocProvider(create: (_) => AudioBloc()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const AppDrawer(),
        ));
  }
}
