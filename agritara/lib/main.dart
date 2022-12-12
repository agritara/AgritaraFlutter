// ignore_for_file: prefer_const_constructors, unused_import
import 'package:flutter/material.dart';
import 'package:agritara/page/login.dart';
import 'package:agritara/page/halaman_petani.dart';
import 'package:agritara/page/halaman_pemerintah.dart';

import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:agritara/starting_page/homepage.dart';
import 'package:agritara/starting_page/login.dart';
import 'package:agritara/starting_page/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
<<<<<<< HEAD
  static Map<int, Color> colorTheme = {
    // 0xFF9966
    50: const Color.fromRGBO(254, 161, 80, .8),
    100: const Color.fromRGBO(254, 161, 80, .8),
    200: const Color.fromRGBO(254, 161, 80, .8),
    300: const Color.fromRGBO(254, 161, 80, .8),
    400: const Color.fromRGBO(254, 161, 80, .8),
    500: const Color.fromRGBO(254, 161, 80, .8),
    600: const Color.fromRGBO(254, 161, 80, .8),
    700: const Color.fromRGBO(254, 161, 80, .8),
    800: const Color.fromRGBO(254, 161, 80, .9),
    900: const Color.fromARGB(255, 253, 172, 102),
  };
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();

        return request;
      },
      child: MaterialApp(
          title: 'AGRITARA',
          theme:
              ThemeData(primarySwatch: MaterialColor(0xFFFEA150, colorTheme)),
          home: LoginPage(),
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case HomePage.routeName:
                return MaterialPageRoute(builder: (_) => const HomePage());

              case RegisterPage.routeName:
                return MaterialPageRoute(builder: (_) => const RegisterPage());
            }
            return null;
          }),
=======

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halaman Utama',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  final String title = 'Halaman Utama';

  @override
  State<HalamanUtama> createState() => _StateHalamanUtama();
}

class _StateHalamanUtama extends State<HalamanUtama> {
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
              title: const Text('Halaman Login'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HalamanLogin()),
                );
              },
            ),
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
              title: const Text('Halaman Pemerintah'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HalamanPemerintah()),
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
            Text('Ini halaman utama!'),
          ],
        ),
      ),
>>>>>>> 93a7527f0dffb289c40ceff9112d7011b0efdf26
    );
  }
}
