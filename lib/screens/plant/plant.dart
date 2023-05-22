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
      body: Column(
        children: [
          Stack(
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
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Center(
                          child: Text(
                        widget.plant.name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/plant.png'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.plant.description,
                      style: const TextStyle(height: 2),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
