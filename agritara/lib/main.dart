// ignore_for_file: prefer_const_constructors, unused_import
import 'package:flutter/material.dart';
import 'package:agritara/page/login.dart';
import 'package:agritara/page/halaman_petani.dart';
import 'package:agritara/page/halaman_pemerintah.dart';

import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:agritara/starting_page/login.dart';
import 'package:agritara/starting_page/register.dart';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:agritara/Navbar.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
              case RegisterPage.routeName:
                return MaterialPageRoute(builder: (_) => const RegisterPage());
            }
            return null;
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key : key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text('Agritara'),
      ),
      body: Column(
        children: [
          FutureBuilder<List<InputPetani>> (
        future: fetchExistingInputPetaniData(),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    'No Data',
                  )
                ],
              );
            } else {
              return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index)=> DataTable(
                        columns: [
                          DataColumn(label: Text('Asal Provinsi')),
                          DataColumn(label: Text('Jenis Komoditas')),
                          DataColumn(label: Text('Jumlah')),
                          DataColumn(label: Text('Tanggal')),
                        ],
                      rows: [
                            DataRow(
                              cells: [
                                DataCell(Text("${snapshot.data![index].fields.daerahAsal}")),
                                DataCell(Text("${snapshot.data![index].fields.namaBarang}")),
                                DataCell(Text("${snapshot.data![index].fields.kuantitasBarang}")),
                                DataCell(Text("${snapshot.data![index].fields.date}")),
                              ],
                            ),
                        ])
              );         
      
            }
        }
      }
    )
    ),
    FutureBuilder<List<InputPetani>> (
        future: fetchExistingInputPetaniData(),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    'No Data',
                  )
                ],
              );
            } else {
              return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index)=> DataTable(
                        columns: [
                          DataColumn(label: Text('Provinsi')),
                          DataColumn(label: Text('Komoditas')),
                          DataColumn(label: Text('Jumlah')),
                        ],
                      rows: [
                            DataRow(
                              cells: [
                                DataCell(Text("${snapshot.data![index].fields.daerahAsal}")),
                                DataCell(Text("${snapshot.data![index].fields.namaBarang}")),
                                DataCell(Text("${snapshot.data![index].fields.kuantitasBarang}")),
                              ],
                            ),
                        ])
              );         
      
            }
        }
      }
    )
    ),
        ],
      )
    );
  }
}

