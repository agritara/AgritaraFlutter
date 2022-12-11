import 'package:flutter/material.dart';

// ========== features homepage ==========
import 'package:agritara/starting_page/homepage.dart';
import 'package:agritara/starting_page/login.dart';

import 'package:provider/provider.dart';
import 'package:agritara/other/cookie_request.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Home',
            style: TextStyle(
                    fontFamily: 'Poppins',),),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomePage()),
              );
            },
          ),
          
          ListTile(
            title: const Text('Login',
              style: TextStyle(
                    fontFamily: 'Poppins',),),
            onTap: () {
              // Route menu ke halaman login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}