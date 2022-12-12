import 'package:agritara/starting_page/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const routeName = '/register';
  //Bisa menyimpan variabel state
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  String? _pilihPeran;
  String? _pilihDaerah;
  List<String> list_pilihPeran = ["Pemda", "Petani"];
  List<String> list_pilihDaerah = [
    "Aceh",
    "Sumatra Utara",
    "Sumatra Barat",
    "Riau",
    "Kepulauan Seribu",
    "Jambi",
    "Bengkulu",
    "Sumatra Selatan",
    "Kepulauan Bangka Belitung",
    "Lampung",
    "Banten",
    "DKI Jakarta",
    "Jawa Barat",
    "Jawa Tengah",
    "Daerah Istimewa Yogyakarta",
    "Jawa Timur",
    "Bali",
    "Nusa Tenggara Barat",
    "Nusa Tenggara Timur",
    "Kalimantan Barat",
    "Kalimantan Tengah",
    "Kalimantan Selatan",
    "Kalimantan Timur",
    "Kalimantan Utara",
    "Sulawesi Barat",
    "Sulawesi Selatan",
    "Sulawesi Tenggara",
    "Sulawesi Tengah",
    "Gorontalo",
    "Sulawesi Utara",
    "Maluku Utara",
    "Maluku",
    "Papua",
    "Papua Tengah",
    "Papua Pegunungan",
    "Papua Selatan"
  ];
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String password1 = "";
  String password2 = "";
  String peran = "";
  String daerah = "";
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color.fromARGB(255, 86, 202, 111),
          Color.fromARGB(255, 86, 202, 111),
          Color.fromARGB(255, 86, 202, 111),
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Silahkan Membuat Akun Anda 😊",
                    style: TextStyle(
                        color: Color.fromARGB(255, 166, 55, 3), fontSize: 22),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color:  Color.fromARGB(255, 216, 200, 154),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 230, 225, 225),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(75, 86, 159, 243),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color.fromARGB(
                                                255, 31, 29, 29)))),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Username",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                  onChanged: (String? value) {
                                    setState(() {
                                      username = value!;
                                    });
                                  },
                                  onSaved: (String? value) {
                                    setState(() {
                                      username = value!;
                                    });
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Username tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color.fromARGB(
                                                255, 23, 22, 22)))),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                  onChanged: (String? value) {
                                    setState(() {
                                      password1 = value!;
                                    });
                                  },
                                  onSaved: (String? value) {
                                    setState(() {
                                      password1 = value!;
                                    });
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color.fromARGB(
                                                255, 26, 24, 24)))),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Masukkan Password Kembali",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                  onChanged: (String? value) {
                                    setState(() {
                                      password2 = value!;
                                    });
                                  },
                                  onSaved: (String? value) {
                                    setState(() {
                                      password1 = value!;
                                    });
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Username tidak boleh kosong!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        DropdownButton(
                          value: _pilihPeran,
                          hint: const Text("Pilih Peran"),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: list_pilihPeran.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _pilihPeran = newValue!;
                            });
                          },
                        ),
                        DropdownButton(
                          value: _pilihDaerah,
                          hint: const Text("Pilih Daerah"),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: list_pilihDaerah.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _pilihDaerah = newValue!;
                            });
                          },
                        ),
                        Container(
                          height: 10,
                        ),
                        Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 500),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                color: Color.fromARGB(255, 12, 11, 11)),
                            child: Center(
                                child: TextButton(
                              child: Text("Buat Akun"),
                              onPressed: (() async {
                                final response = await request.post(
                                    "https://agritara.pythonanywhere.com/registerLogin/register_flutter/",
                                    {
                                      'username': username,
                                      'password1': password1,
                                      'password2': password2,
                                      'peran': peran,
                                      'daerah': daerah,
                                    });
                                if (response['status'] == 'success') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        "Akun anda telah berhasil dibuat"),
                                  ));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        "Akun anda belum berhasil terbuat, silahkan isi data kembali secara lengkap!"),
                                  ));
                                }
                              }),
                            ))),
                        Container(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 500),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(300),
                              color: Colors.orange[900]),
                          child: Center(
                            child: TextButton(
                              child: Text("Kembali"),
                              onPressed: () {
                                // Route kembali ke login
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
