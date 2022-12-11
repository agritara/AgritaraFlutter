import 'package:flutter/material.dart';
import 'package:agritara/widgets/drawer.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home';

  // Color themes
  static const blackColorTheme = Color(0xFF24262A);
  static const orangeColorTheme = Color(0xFFFEA150);

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