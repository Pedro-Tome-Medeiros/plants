import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plants/screens/plant/plant.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../models/plant.dart';
import 'package:collection/collection.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({Key? key}) : super(key: key);

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  late bool _read;
  late List<Plant> _items;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    _items = [];
    _read = false;
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Ler código'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/plants.json');
    final data = (json.decode(response) as List<dynamic>)
        .map((e) => Plant.fromJson(e))
        .toList();

    setState(() {
      _items = data;
    });
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      final Plant? plant =
          _items.firstWhereOrNull((element) => element.qrCode == scanData.code);

      if (plant != null && _read == false) {
        _read = true;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlantPage(plant: plant)),
        ).then((value) => _read = false);
      } else {
        log("Not found");
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
