import 'package:flutter/material.dart';
import 'signup_page.dart'; // Changed from './signup_page.dart'

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
      title: 'Track Your Progress',
      description:
          'Monitor your fitness journey with detailed insights and statistics',
      image: 'assets/images/guypushup-intropage.png',
    ),
    OnboardingItem(
      title: 'oppy', // Empty second section
      description: 'bagas',
      image: 'assets/images/guypushup-intropage.png',
    ),
    OnboardingItem(
      title: 'adit', // Empty third section
      description: 'farel',
      image: 'assets/images/guypushup-intropage.png',
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
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
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
                          child: const Image(
                            image: AssetImage(
                                'assets/images/guypushup-intropage.png'),
                            width: 24,
                            height: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'FrogoFroyo',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF2600FA),
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: _skipOnboarding,
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        foregroundColor: const Color(0xFF666666),
                      ),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 16,
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
                    print('Page changed to: $page');
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  physics: const ClampingScrollPhysics(),
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 300,
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
                                height: 200,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Text(
                            _pages[index].title,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF1A1A1A),
                              height: 1.2,
                              letterSpacing: -0.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _pages[index].description,
                            style: const TextStyle(
                              fontSize: 17,
                              color: Color(0xFF666666),
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
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _pages.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentPage == index ? 24 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? const Color(0xFF2600FA)
                                : const Color(0xFF2600FA).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
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
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          elevation: 4,
                          shadowColor: const Color(0xFF2600FA).withOpacity(0.5),
                        ).copyWith(
                          overlayColor: MaterialStateProperty.all(
                            Colors.white.withOpacity(0.2),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _currentPage < _pages.length - 1
                                  ? 'Next'
                                  : 'Get Started',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.2,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward_rounded),
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
