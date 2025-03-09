import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../home/home_screen.dart'; // Import HomeScreen

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            children: [
          // Logo Section (Reduced top padding)
          SizedBox(height: 76), // Adjusted from 76 to 40 for better spacing
          SvgPicture.asset(
            'assets/images/logo.svg',
            width: 144.6, // Adjust size as needed
            height: 26.83,
          ),
          SizedBox(height: 1), // Reduced space between logo and onboarding content

          // PageView for Onboarding Screens
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                OnboardingPage(
                  title: 'Friendly Broker',
                  description:
                      'Friendly broker is a must have if you want to be successful in your financial life.',
                  imagePath: 'assets/images/first_onboarding.svg',
                  currentPage: _currentPage,
                  pageIndex: 0,
                  onGetStarted: goToHomeScreen,
                ),
                OnboardingPage(
                  title: 'Great Analytics',
                  description:
                      'Amazing analytics for you to keep track of your stocks, expenses, and currencies.',
                  imagePath: 'assets/images/second_onboarding.svg',
                  currentPage: _currentPage,
                  pageIndex: 1,
                  onGetStarted: goToHomeScreen,
                ),
                OnboardingPage(
                  title: 'Compare Stocks',
                  description:
                      'Compare your stocks easily with the help of the free built-in compare feature in the app.',
                  imagePath: 'assets/images/third_onboarding.svg',
                  currentPage: _currentPage,
                  pageIndex: 2,
                  onGetStarted: goToHomeScreen,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final int currentPage;
  final int pageIndex;
  final VoidCallback onGetStarted;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.currentPage,
    required this.pageIndex,
    required this.onGetStarted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Onboarding Image
          SvgPicture.asset(
            imagePath,
            width: 350,
            height: 350,
          ),
          SizedBox(height: 20),

          // Title
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Color(0xFF757575)),
          ),
          SizedBox(height: 40),

          // Dot Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) => buildDot(index)),
          ),
          SizedBox(height: 20),

          // Get Started Button
          ElevatedButton(
            onPressed: onGetStarted,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFF28C38),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: Size(208, 58),
            ),
            child: Text(
              'Get Started',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildDot(int index) {
  bool isSelected = currentPage == index;

  return Container(
    margin: EdgeInsets.symmetric(horizontal: 4.0),
    height: 16.0, // Increased for better visibility
    width: 16.0, 
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isSelected ? Color(0xFFF28C38) : Color(0xFFFFE0B2), // Bright & faded orange
    ),
    child: Center(
      child: Icon(
        Icons.attach_money,
        color: isSelected ? Colors.white : Color(0xFFF28C38), // White on selected, orange on faded
        size: 16.0, 
      ),
    ),
  );
}
}
