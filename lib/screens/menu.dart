import 'package:flutter/material.dart';
import 'package:plants/screens/plant/plants.dart';
import 'package:plants/screens/plant/qrCode.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PlantsPage())),
              child: const Text('Lista de plantas'),
            ),
            TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const QrCodePage())),
              child: const Text('Ler planta'),
            )
          ],
        ),
      ),
    );
  }
}
