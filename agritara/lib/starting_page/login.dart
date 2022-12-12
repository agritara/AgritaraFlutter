import 'package:agritara/starting_page/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:agritara/Navbar.dart'

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';
  //Bisa menyimpan variabel state
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String password1 = "";
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
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome Back to Agritara!! 🍎🥦🥬",
                    style: TextStyle(
                        color: Color.fromARGB(255, 167, 33, 2), fontSize: 22),
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
                              color: Color.fromARGB(255, 240, 240, 240),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(75, 48, 145, 230),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.black))),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Masukkan Username",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
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
                                        bottom:
                                            BorderSide(color: Colors.black))),
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
                            ],
                          ),
                        ),
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
                                  child: Text("Login"),
                                  onPressed: () async {
                                    final response = await request.login(
                                        "https://agritara.pythonanywhere.com/registerLogin/login_flutter/",
                                        {
                                          'username': username,
                                          'password': password1,
                                        });
                                    if (response['status']) {
                                      if (!mounted) return;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                            "Anda telah berhasil Login."),
                                      ));
                                    } else {
                                      if (!mounted) return;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                            "Anda belum berhasil Login."),
                                      ));
                                    }
                                  }),
                            )),
                        Container(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 500),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(300),
                              color: Color.fromARGB(255, 8, 7, 7)),
                          child: Center(
                            child: TextButton(
                              child: Text("Buat Akun"),
                              onPressed: () {
                                // Route menu ke halaman utama
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()),
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
