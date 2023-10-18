import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:remit_choice_app/Authentication_Screens/login_screen.dart';
import 'package:remit_choice_app/Authentication_Screens/registration.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({Key? key}) : super(key: key);

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  final List<String> _carouselImages = [
    'assets/images1.jpg', // Replace with your image paths
    'assets/images2.jpg',
    'assets/images3.jpg',
  ];

  int _currentIndex = 0; // To keep track of the current image index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const SizedBox(
        height: 40,
      ),
      Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(20.0),
        child: Image.asset(
          'assets/logo.png',
          width: 100,
          height: 80,
        ),
      ),
      const SizedBox(
        height: 20,
      ),

      //===========================Carousel Slider Section========================
      CarouselSlider(
        items: _carouselImages.map((imageUrl) {
          return Builder(
            builder: (BuildContext context) {
              return Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          );
        }).toList(),
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 35 / 35,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index; // Update current index when image changes
            });
          },
        ),
      ),
      //=============================================End of C_S========================
      const SizedBox(
        height: 40,
      ),
      //========================================Text Widgets==============================
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: const [
      //     Text(
      //       "Fast processing",
      //       style: TextStyle(
      //         fontSize: 25,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     )
      //   ],
      // ),
      // const SizedBox(
      //   height: 10,
      // ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: const [
      //     Text(
      //       "Fast Processing with guaranteed on-time \n                             delivery",
      //       style: TextStyle(
      //         fontSize: 15,
      //         //fontWeight: FontWeight.bold,
      //       ),
      //     )
      //   ],
      // ),
      //========================================End of Text Widgets==============================

      //===============================Dots Indexing=================================
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _carouselImages.map((imageUrl) {
          int index = _carouselImages.indexOf(imageUrl);
          return Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    _currentIndex == index ? Colors.orange : Colors.transparent,
                border: Border.all(
                  color: _currentIndex == index ? Colors.orange : Colors.orange,
                  width: 2, // Highlight the active dot
                ),
              ));
        }).toList(),
      ),
      //==========================================================End of Dots indexing====================
      const SizedBox(
        height: 80,
      ),
//====================================Start of Buttons Sections=====================
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const LoginScreen())));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.16,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.orange, // Orange border color
                ),
                borderRadius: BorderRadius.circular(8), // Border radius
              ),
            ),
            child: Column(
              children: const [
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(right: 20), // Margin from the right side
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SignUpScreen())));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.orange,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.15,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.orange, // Orange border color
                  ),
                  borderRadius: BorderRadius.circular(8), // Border radius
                ),
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
              child: Column(
                children: const [
                  Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),

//====================================Eng of Buttons Sections=====================
    ]));
  }
}

void main() {
  runApp(const MaterialApp(home: StartupPage()));
}
