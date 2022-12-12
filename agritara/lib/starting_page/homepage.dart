import 'package:flutter/material.dart';
import 'package:agritara/widgets/drawer.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home';

  // Color themes
  static const greenColorTheme = Color.fromARGB(255, 47, 166, 34);
  static const orangeColorTheme = Color.fromARGB(255, 214, 134, 64);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: const Text(
          'Home Page', style: TextStyle(fontFamily: 'Poppins')
        ),
      ),
      drawer: const AppDrawer(),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(
                  horizontal: 23.0, vertical: 130.0),
            child: Center(
              child: Text(
                'AGRITARA',
                style: TextStyle(
                    color: Color(0xFFFEA150),
                    fontSize: 55,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),
              ),
            ),         
          ),
        ],
      ),
    );
  }
}