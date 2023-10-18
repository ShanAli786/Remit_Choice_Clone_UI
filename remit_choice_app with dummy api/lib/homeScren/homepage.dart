// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:remit_choice_app/AuthenticationProvider/AuthenticationProvider.dart';
import 'package:remit_choice_app/ChatScreen/chat_screen.dart';
import 'package:remit_choice_app/Recipients/Recipients.dart';
import 'package:remit_choice_app/Settings/settings.dart';
import 'package:remit_choice_app/Transfer/transfer.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required String accesstoken}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  int _currentIndex = 0;
  late String _greeting = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _setGreeting();
  }

  void _setGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 0 && hour < 12) {
      _greeting = 'Good Morning';
    } else if (hour >= 12 && hour < 18) {
      _greeting = 'Good Afternoon';
    } else if (hour >= 18 && hour < 21) {
      _greeting = 'Good Evening';
    } else {
      _greeting = 'Good Night';
    }
  }

  void main() {
    runApp(
      ChangeNotifierProvider(
        create: (context) => AuthenticationProvider(),
        child: const MyApp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = [
      _buildCarouselSlider(),
      const TransferTab(),
      const RecipientsTab(),
      const SettingsTab(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(_greeting),
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
            onPressed: () {
              // Handle the notification icon action
            },
            icon: const Icon(
              Icons.notifications_none,
              size: 35,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 70, bottom: 10),
              child: Text(
                'Shan Ali [123214]',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ),
          ),
        ),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildNavigationBarItem(
                Icon(Icons.home,
                    color: _selectedIndex == 0 ? Colors.orange : Colors.grey),
                'Home',
                0),
            _buildNavigationBarItem(
                Icon(Icons.transfer_within_a_station_sharp,
                    color: _selectedIndex == 1 ? Colors.orange : Colors.grey),
                'Transfer',
                1),
            _buildLargeNavigationBarItem(),
            _buildNavigationBarItem(
                Icon(Icons.people_alt,
                    color: _selectedIndex == 2 ? Colors.orange : Colors.grey),
                'Recipients',
                2),
            _buildNavigationBarItem(
                Icon(Icons.settings,
                    color: _selectedIndex == 3 ? Colors.orange : Colors.grey),
                'Settings',
                3),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: SizedBox(
          width: 60,
          height: 60,
          child: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 240, 160, 41),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(),
                ),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: const Icon(
              Icons.chat_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildNavigationBarItem(Widget icon, String label, int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          icon,
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.orange : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLargeNavigationBarItem() {
    return InkWell(
      onTap: () {
        _onItemTapped(4); // Select the "Recipients" navigation item
        setState(() {
          _selectedIndex = 4; // Update the selected index to 2
        });
        // Handle the action for the "Send Now" button
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              // Handle the action for the "Send Now" button
            },
            backgroundColor: Colors.orange,
            child: const Icon(Icons.rocket_launch_rounded),
          ),
          Text(
            'Send Now',
            style: TextStyle(
              color: _selectedIndex == 2 ? Colors.orange : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselSlider() {
    return Column(
      children: [
        CarouselSlider(
          items: [
            Hero(
              tag: 'carousel_image_1',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/home1.png'),
              ),
            ),
            Hero(
              tag: 'carousel_image_2',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/home2.png'),
              ),
            ),
            Hero(
              tag: 'carousel_image_3',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/home3.png'),
              ),
            ),
          ],
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Container(
              width: 12.0,
              height: 12.0,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.orange : Colors.white,
                border: Border.all(
                  color: _currentIndex == index ? Colors.orange : Colors.orange,
                  width: 1,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/image4.jpg',
            height: 200,
          ),
        ),
      ],
    );
  }
}
