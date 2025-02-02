import 'package:flutter/material.dart';
import 'signup_page.dart'; // Changed from './signup_page.dart'
import 'package:flutter/foundation.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _pages = [
    OnboardingItem(
      title: 'Track Yopie Progress',
      description:
          'Monitor your fitness journey with detailed insights and statistics',
      image: 'assets/images/download.jpeg',
    ),
    OnboardingItem(
      title: 'oppy', // Empty second section
      description: 'bagas',
      image: 'assets/images/download.jpeg',
    ),
    OnboardingItem(
      title: 'adit', // Empty third section
      description: 'farel',
      image: 'assets/images/download.jpeg',
    ),
  ];

  void _navigateToSignUp() {
    try {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const SignUpPage()),
        (route) => false, // This removes all previous routes
      );
    } catch (e) {
      print('Navigation error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unable to navigate to Sign Up page')),
        );
      }
    }
  }

  void _nextPage() {
    try {
      if (_currentPage < _pages.length - 1) {
        print('Moving to next page: ${_currentPage + 1}');
        _pageController.animateToPage(
          _currentPage + 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutQuad,
        );
      } else {
        _navigateToSignUp();
      }
    } catch (e) {
      print('Page transition error: $e');
    }
  }

  void _skipOnboarding() {
    try {
      _navigateToSignUp(); // Directly navigate to signup without animation
    } catch (e) {
      print('Skip error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final newPage = _pageController.page?.round() ?? 0;
      if (newPage != _currentPage) {
        setState(() {
          _currentPage = newPage;
        });
      }
    });
    DefaultAssetBundle.of(context)
        .load(_pages[0].image)
        .then((_) => print('✅ Asset exists!'))
        .catchError((error) => print('❌ Asset not found: $error'));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final Size screenSize = MediaQuery.of(context).size;
    final double paddingScale = screenSize.width * 0.06; // 6% of screen width

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFE1E5FF),
              Color(0xFFD4DAFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(paddingScale),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(screenSize.width * 0.02),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Image(
                            image:
                                const AssetImage('assets/images/download.jpeg'),
                            width: screenSize.width * 0.06,
                            height: screenSize.width * 0.06,
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.03),
                        Text(
                          'FrogoFroyo',
                          style: TextStyle(
                            fontSize: screenSize.width * 0.06,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF2600FA),
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: _skipOnboarding,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.04,
                          vertical: screenSize.width * 0.02,
                        ),
                        foregroundColor: const Color(0xFF666666),
                      ),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.04,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  physics: const BouncingScrollPhysics(),
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: paddingScale),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: screenSize.height * 0.35,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Image.asset(
                                _pages[index].image,
                                height: screenSize.height * 0.25,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.04),
                          Text(
                            _pages[index].title,
                            style: TextStyle(
                              fontSize: screenSize.width * 0.07,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF1A1A1A),
                              height: 1.2,
                              letterSpacing: -0.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          Text(
                            _pages[index].description,
                            style: TextStyle(
                              fontSize: screenSize.width * 0.04,
                              color: const Color(0xFF666666),
                              height: 1.4,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingScale),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _pages.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(
                              horizontal: screenSize.width * 0.01),
                          width: _currentPage == index
                              ? screenSize.width * 0.06
                              : screenSize.width * 0.02,
                          height: screenSize.width * 0.02,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? const Color(0xFF2600FA)
                                : const Color(0xFF2600FA).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2600FA),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: screenSize.height * 0.02),
                          elevation: 4,
                          shadowColor: const Color(0xFF2600FA).withOpacity(0.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _currentPage < _pages.length - 1
                                  ? 'Next'
                                  : 'Get Started',
                              style: TextStyle(
                                fontSize: screenSize.width * 0.045,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.2,
                              ),
                            ),
                            SizedBox(width: screenSize.width * 0.02),
                            Icon(Icons.arrow_forward_rounded,
                                size: screenSize.width * 0.05),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String image;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.image,
  });
}
