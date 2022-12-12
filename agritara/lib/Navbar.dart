import 'package:flutter/material.dart';
import 'package:app/main.dart';

class Navbar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('AGRITARA'), 
            accountEmail: Text('agritara.indo@gmails.com'),
              decoration: BoxDecoration(
                color: Color.fromARGB(210, 117, 216, 110),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://img-aws.ehowcdn.com/877x500p/s3-us-west-1.amazonaws.com/contentlab.studiod/getty/f38449d949b744a8ae5cb79029f8165d?type=webp'
                  ,),
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ListTile(
          leading: Icon(Icons.account_box),
          title: Text('Menu Utama Pemerintah Daerah'),
          onTap: () => (){
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(builder: (context) => const home_pemda()),
            //   );
            },
        ),
        ListTile(
          leading: Icon(Icons.account_box),
          title: Text('Menu Utama Petani'),
          onTap: () => (){
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(builder: (context) => const MyHomePage()),
            //   );
            },
        ),
        Divider(), //membuat garis pemisah dibagian atas "About Us"
        ListTile(
          leading: Icon(Icons.eco),
          title: Text('About Us'),
          onTap: () => print('about agritara'),
        ),
        ],
      ),
    );
  }
}