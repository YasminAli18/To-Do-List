import 'package:flutter/material.dart';
import 'home2.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Top section with Skip button on the left
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                    );
                  // Navigate to the next screen (or skip onboarding)
                },
                child: _buildButton('Skip', Colors.black, Colors.grey),
              ),
            ),
          ),
          
          // PageView for the 3 images
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                _buildPage('assets/images/Frame1.png', 'Manage your tasks', 'You can easily manage all of your daily tasks in DoMe for free'),
                _buildPage('assets/images/Frame2.png', 'Create daily routine', 'In Uptodo  you can create your personalized routine to stay productive'),
                _buildPage('assets/images/Frame3.png', 'Organize your tasks', 'You can organize your daily tasks by adding your tasks into separate categories'),
              ],
            ),
          ),
          
          // Navigation buttons (Back, Skip, Next)
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button on the left (Always visible)
                GestureDetector(
                  onTap: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: _buildButton('Back', Colors.black, Colors.grey),
                ),
                
                // Next or Get Started Button on the right
                if (_currentPage < 2)
                  GestureDetector(
                    onTap: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: _buildButton('Next', Colors.purple, Colors.white),
                  )
                else
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WelcomeScreen()),
                        );
                      },
                      child: _buildButton('Get Started', Colors.purple, Colors.white),
                    ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to build each page with an image, title, and description
  Widget _buildPage(String imagePath, String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Image.asset(
            imagePath, 
            fit: BoxFit.contain,
            width: 200, // To make the image take up all available space while maintaining its aspect ratio
          ),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          description,
          style: TextStyle(color: Colors.white, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Method to build the buttons
  Widget _buildButton(String text, Color backgroundColor, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
