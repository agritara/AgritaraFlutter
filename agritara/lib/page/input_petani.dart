import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

// Models
import 'package:self_tests/models/input_petani_model.dart';
import 'package:self_tests/models/fields_model.dart';

// HTTP Requirements
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:self_tests/main.dart';
import 'package:self_tests/Navbar.dart';
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
      //home: const HalamanUtama(),
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
  Future<List<InputPetani>> fetchExistingInputPetaniData() async {
    var uri = Uri.parse('https://agritara.pythonanywhere.com/tambah/get_barang/');
    var response = await http.get(
      uri,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object InputPetani
    List<InputPetani> listInputPetani = [];
    for (var d in data) {
      if (d != null) {
        listInputPetani.add(InputPetani.fromJson(d));
      }
    }

    return listInputPetani;
  }

  sendInputPetaniData({required String namaBarang, required int kuantitasBarang}) async {
    var uri = Uri.parse('https://agritara.pythonanywhere.com/tambah/nambah_barang/');
    var response = await http.post(
      uri,
      // headers: {
      //   "Access-Control-Allow-Origin": "*",
      //   "Content-Type": "application/json",
      // },
      body: {
        'nama_barang' : namaBarang,
        'kuantitas_barang' : kuantitasBarang.toString(),
      }
    );
  }

  String getDateString() {
    return  DateTime.now().toString().split(' ')[0];
  }

  _StateHalamanInputPetani();
  final _formKey = GlobalKey<FormState>();
  String _namaBarang = "";
  int _kuantitasBarang = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            /*ListTile(
              title: const Text('Halaman Utama'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HalamanUtama()),
                );
              },
            ),*/
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
      body: Column (
        children: [
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      // Menggunakan padding sebesar 8 pixels
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Contoh: Beras",
                          labelText: "Nama Barang",
                          // Menambahkan icon agar lebih intuitif
                          // icon: const Icon(Icons.people),
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            _namaBarang = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            _namaBarang = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama barang tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      // Menggunakan padding sebesar 8 pixels
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Contoh: 15000",
                          labelText: "Nominal",
                          // Menambahkan icon agar lebih intuitif
                          // icon: const Icon(Icons.people),
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            _kuantitasBarang = int.parse(value!);
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            _kuantitasBarang = int.parse(value!);
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nominal tidak boleh kosong!';
                          }
                        },
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Add to savedList
                          print(_namaBarang);
                          print(_kuantitasBarang);
                          sendInputPetaniData(namaBarang: _namaBarang, kuantitasBarang: _kuantitasBarang);
                          // print(getDateString());
                          // print('${toSave.judul} ${toSave.nominal} ${toSave.jenis}'); // testing purposes
                          // savedList.add(toSave);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HalamanInputPetani()),
                          );
                        }
                      },
                      child: const Text(
                        "Simpan",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          FutureBuilder<List<InputPetani>> (
              future: fetchExistingInputPetaniData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return Column(
                      children: const [
                        Text(
                          "Belum ada input",
                          style: TextStyle(
                            color: Color(0xff59A5D8),
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                    return ListView.builder(
                      padding: const EdgeInsets.only(top: 15),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index)=> Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                child: ListTile(
                                  title: Text(
                                    "${snapshot.data![index].fields.namaBarang}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    );
                  }
                }
              }
          ),
        ],
      )
    );
  }
}
