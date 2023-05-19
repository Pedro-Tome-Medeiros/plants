import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../models/plant.dart';

class PlantPage extends StatefulWidget {
  final Plant plant;
  const PlantPage({Key? key, required this.plant}) : super(key: key);

  @override
  _PlantPageState createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              height: 150,
              color: Colors.lightGreen,
            ),
          ),
          ClipPath(
            clipper: WaveClipperOne(flip: true),
            child: Container(
              height: 140,
              color: Colors.green,
              child: Center(
                  child: Text(
                widget.plant.name,
                style: TextStyle(color: Colors.white, fontSize: 24),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
