import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF5FD),
      body: SafeArea(
        child: Column(
          children: [
            //header
            Padding(padding: EdgeInsets.all(8), child: HeaderCustom()),

            //campo de busca
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Search destination...',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),

                    Spacer(),
                    Icon(Icons.tune),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//custom para header
class HeaderCustom extends StatelessWidget {
  const HeaderCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/profile.png'),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello, Smith', style: TextStyle(fontSize: 15)),
              Text(
                'Where to next?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ],
          ),
        ),

        Spacer(),

        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.notifications_none, color: Colors.black, size: 30),
        ),
      ],
    );
  }
}
