import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plants/models/plant.dart';

class PlantsPage extends StatefulWidget {
  const PlantsPage({Key? key}) : super(key: key);

  @override
  State<PlantsPage> createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage> {
  List<Plant> _items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'PLANTAS - EPROSEC',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      const snackBar = SnackBar(content: Text('Tap'));

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Card(
                      key: ValueKey(_items[index].id),
                      margin: const EdgeInsets.all(10),
                      color: Colors.amber.shade100,
                      child: ListTile(
                        title: Text(_items[index].name),
                        subtitle: Text(_items[index].description),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
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
}
