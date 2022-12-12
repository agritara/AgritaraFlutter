import 'dart:convert';
import 'package:agritara/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:agritara/model/dummy_tutorial_model.dart';
import 'package:agritara/page/input_petani.dart';
import 'package:agritara/model/model_halaman_petani.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halaman Petani',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanPetani extends StatefulWidget {
  const HalamanPetani({super.key});

  final String title = 'Halaman Petani';

  @override
  State<HalamanPetani> createState() => _StateHalamanPetani();
}

class _StateHalamanPetani extends State<HalamanPetani> {
  Future<List<ToDo>> fetchToDo() async {
    var url = Uri.parse(
        'https://jsonplaceholder.typicode.com/todos?_start=0&_limit=10');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<ToDo> listToDo = [];
    for (var d in data) {
      if (d != null) {
        listToDo.add(ToDo.fromJson(d));
      }
    }

    return listToDo;
  }

  Future<List<BarangPetani>> fetchBarangPetani() async {
    var url = Uri.parse('????????????'); // INI LINK
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<BarangPetani> listBarangPetani = [];
    for (var d in data) {
      if (d != null) {
        listBarangPetani.add(BarangPetani.fromJson(d));
      }
    }

    return listBarangPetani;
  }

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
                    MaterialPageRoute(
                        builder: (context) => const HalamanUtama()),
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
        body: FutureBuilder(
            future: fetchToDo(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada to do list :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].completed}"),
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}
