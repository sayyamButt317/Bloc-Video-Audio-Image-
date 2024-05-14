import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:msb_task4/presentation/screen/audio_screen.dart';
import 'package:msb_task4/presentation/screen/image_screen.dart';
import 'package:msb_task4/presentation/screen/video_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.only(top: 8.0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Row(),
            ),
            ListTile(
              title: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VideoPlayerView()),
                    );
                  },
                  child: const Text("Video")),
              leading: const Icon(
                LineIcons.videoAlt,
                color: Colors.black,
                size: 30,
              ),
            ),
            ListTile(
                title: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ImageScreen()),
                      );
                    },
                    child: const Text("Image")),
                leading: const Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                  size: 30,
                )),
            ListTile(
                title: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AudioScreen()),
                      );
                    },
                    child: const Text("Audio")),
                leading: const Icon(
                  Icons.multitrack_audio_rounded,
                  color: Colors.black,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
