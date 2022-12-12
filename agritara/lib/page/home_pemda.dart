import 'package:agritara/main.dart';
import 'package:flutter/material.dart';
import 'package:agritara/model/request_pemda.dart' as rp;
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "Unknown";
  String _feedback = "";

  Future<List<rp.Requestan>> fetchToDo() async {
    var url = Uri.parse('https://agritara.pythonanywhere.com/permintaan/req_json/');
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
    List<rp.Requestan> list_requestan = [];
    for (var d in data) {
      if (d != null) {
        list_requestan.add(rp.Requestan.fromJson(d));
      }
    }

    return list_requestan;
  }

  // postData(String request, String kuantitas) async {
  //
  //   var response = await http.post(
  //     // Uri.parse('https://agritara.pythonanywhere.com/permintaan/req_json/'),
  //       Uri.parse('http://localhost:8000/pemda/home/'),
  //       // body: {
  //
  //       body: {
  //         "request":request,
  //         "kuantitas":kuantitas,
  //       }
  //   );
  //
  //   print(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Pemerintah Daerah'),
      ),
      body:
      FutureBuilder(
          future: fetchToDo(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada requestan :(",
                      style: TextStyle(
                          color: Color(0xff59A5D8),
                          fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index)=> DataTable(
                        columns: [
                          DataColumn(label: Text('Nama Barang')),
                          DataColumn(label: Text('Jumlah Barang')),
                          DataColumn(label: Text('Tanggal Pesan')),
                        ],
                      rows: [
                            DataRow(
                              cells: [
                                DataCell(Text("${snapshot.data![index].fields}")),
                                DataCell(Text("${snapshot.data![index].kuantitas}")),
                                DataCell(Text("${snapshot.data![index].date}")),
                              ],
                            ),
                        ])
                );
              }
            }
          }
      ),
    );}
}