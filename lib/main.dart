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
        child: SingleChildScrollView(
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
              //filtro
              Padding(padding: EdgeInsets.all(8), child: FilterCustom()),
              //destinations
              Padding(padding: EdgeInsets.all(8), child: DestinationsCustom()),
              //promo
              Padding(padding: EdgeInsets.all(8), child: PromoCustom()),
            ],
          ),
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

//filtro
class FilterCustom extends StatefulWidget {
  const FilterCustom({super.key});
  @override
  State<FilterCustom> createState() => _FilterCustomState();
}

class _FilterCustomState extends State<FilterCustom> {
  final List<String> _options = ['Popular', 'Local', 'Regional', 'Global'];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_options.length, (index) {
          final isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedIndex = index),
            child: Container(
              width: 105,
              height: 52,
              margin: EdgeInsets.only(right: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF1A1A2E) : Color(0xFFEDF5FD),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF5A6273)
                      : const Color(0xFFE4EBF2),
                  width: 1.5,
                ),
              ),
              child: Text(
                _options[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF687086),
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

//gestinations custom
class DestinationsCustom extends StatelessWidget {
  const DestinationsCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Top Destinations',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Spacer(),
            Text(
              'See all',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Color(0xFF687086),
                fontSize: 14,
              ),
            ),
          ],
        ),

        Row(
          children: [
            Expanded(
              child: DestinationCard(
                name: 'Santorini',
                country: 'GR',
                imageCountry: 'assets/images/santorini.png',
                rating: 4.0,
                price: 840,
              ),
            ),
            Expanded(
              child: DestinationCard(
                name: 'Kyoto',
                country: 'JP',
                imageCountry: 'assets/images/kyoto.png',
                rating: 5.0,
                price: 500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//cards de destinations
class DestinationCard extends StatelessWidget {
  final String name;
  final String country;
  final String imageCountry;
  final double rating;
  final int price;

  const DestinationCard({
    super.key,
    required this.name,
    required this.country,
    required this.imageCountry,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(imageCountry),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.topRight,
              padding: EdgeInsets.all(8),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(country, style: TextStyle(fontSize: 12)),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 12, right: 4, bottom: 3),
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),

          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12, bottom: 12, right: 16),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 25),
                    Text(
                      rating.toString(),
                      style: TextStyle(fontSize: 17, color: Color(0xFF8A939E)),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Text(
                      '\$$price',
                      style: TextStyle(color: Color(0xFFF96D1F), fontSize: 17),
                    ),

                    Text(
                      '/person',
                      style: TextStyle(fontSize: 17, color: Color(0xFF8A939E)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PromoCustom extends StatelessWidget {
  const PromoCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Color(0XFFFEF4EC)],
        ),
      ),
      child: Row(
        children: [
          PromoText(),
          Spacer(),
          Image.asset('assets/images/gift.png', scale: 3),
        ],
      ),
    );
  }
}

class PromoText extends StatelessWidget {
  const PromoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: 105,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0XFFFCF1E8),
          ),

          alignment: Alignment.center,
          child: Text(
            'PROMO',
            style: TextStyle(
              color: Color(0XFFE7702B),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 16, bottom: 5),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(text: 'Get '),
                TextSpan(
                  text: '\$3 Off ',
                  style: TextStyle(color: Color(0XFF2964D9)),
                ),
                TextSpan(text: 'on next Trip'),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Text(
            'Invite friends and earn \nrewards',
            style: TextStyle(color: Color(0XFF66707D), fontSize: 20),
          ),
        ),

        Container(
          height: 50,
          width: 165,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xFF1A1A2E),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  'Invite Now',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ],
    );
  }
}

//consertar o problema de alinhamento do top destinations depois
