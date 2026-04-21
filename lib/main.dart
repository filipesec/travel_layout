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

            //jornada
            Padding(padding: EdgeInsets.all(8), child: JourneyCustom()),
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

//custom para Journey
class JourneyCustom extends StatelessWidget {
  const JourneyCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: 1000,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage('assets/images/journey.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Plan Your Next\nJourney',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 15),
            child: Text(
              'Plan your next journey with\nease and confidence.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFF87315),
              minimumSize: Size(0, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Explore Now',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
