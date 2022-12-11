import 'package:flutter/material.dart';
import 'package:agritara/main.dart';
import 'package:agritara/page/halaman_petani.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halaman Input Petani',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanInputPetani extends StatefulWidget {
  const HalamanInputPetani({super.key});

  final String title = 'Halaman Input Petani';

  @override
  State<HalamanInputPetani> createState() => _StateHalamanInputPetani();
}

class _StateHalamanInputPetani extends State<HalamanInputPetani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: const Text('Halaman Utama'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HalamanUtama()),
                );
              },
            ),
            ListTile(
              title: const Text('Halaman Petani'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HalamanPetani()),
                );
              },
            ),
            ListTile(
              title: const Text('Halaman Input Petani'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HalamanInputPetani()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Ini halaman Input Petani!'),
          ],
        ),
      ),
    );
  }
}
