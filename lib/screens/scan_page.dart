import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {

  late CameraController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CameraController(cameras[0],ResolutionPreset.high);
    _controller.initialize().then((_){
      if(!mounted){
        return;
      }
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children:<Widget> [
          CameraPreview(_controller),
          Container(

          )
        ],
      )


    );
  }
}
