import 'package:flutter/material.dart';
import 'package:agritara/main.dart';
import 'package:agritara/page/halaman_pemerintah.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halaman Input Pemerintah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanInputPemerintah extends StatefulWidget {
  const HalamanInputPemerintah({super.key});

  final String title = 'Halaman Input Pemerintah';

  @override
  State<HalamanInputPemerintah> createState() => _StateHalamanInputPemerintah();
}

class _StateHalamanInputPemerintah extends State<HalamanInputPemerintah> {
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
              title: const Text('Halaman Pemerintah'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HalamanPemerintah()),
                );
              },
            ),
            ListTile(
              title: const Text('Halaman Input Pemerintah'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HalamanInputPemerintah()),
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
            Text('Ini halaman Input Pemerintah!'),
          ],
        ),
      ),
    );
  }
}
