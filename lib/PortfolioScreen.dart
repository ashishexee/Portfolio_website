import 'package:flutter/material.dart';
import 'package:portfolio/about_page.dart';
import 'package:portfolio/contacts_page.dart';
import 'package:portfolio/projects_page.dart';
import 'package:portfolio/resume_page.dart';
import 'package:portfolio/sidebar.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with TickerProviderStateMixin {
  int selectedIndex = 0;
  List<String> navItems = ['About', 'Resume', 'Projects', 'Contact'];
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1117), // Premium dark background
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF0D1117), Color(0xFF161B22)],
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF2A2A2A), Color(0xFF1F1F1F)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                          BoxShadow(
                            color: Color(0xFFD4AF37).withOpacity(0.1),
                            blurRadius: 30,
                            offset: Offset(0, 0),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.white.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Spacer(),
                          Row(
                            children: List.generate(
                              navItems.length,
                              (index) => Padding(
                                padding: EdgeInsets.only(
                                  left: index > 0 ? 20 : 0,
                                ),
                                child: GestureDetector(
                                  onTap: () => _navigateToPage(index),
                                  child: _buildNavItem(
                                    navItems[index],
                                    selectedIndex == index,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),

                    Expanded(
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: _buildPageContent(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToPage(int index) {
    setState(() => selectedIndex = index);
    _animationController.reset();
    _animationController.forward();
  }

  Widget _buildPageContent() {
    switch (selectedIndex) {
      case 0:
        return AboutPage();
      case 1:
        return ResumePage();
      case 2:
        return ProjectsPage();
      case 3:
        return ContactPage();
      default:
        return AboutPage();
    }
  }

  Widget _buildNavItem(String text, bool isActive) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Color(0xFFD4AF37).withOpacity(0.4),
        hoverColor: Color(0xFFD4AF37).withOpacity(0.3),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          decoration: BoxDecoration(
            gradient:
                isActive
                    ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFD4AF37),
                        Color(0xFFD4AF37).withOpacity(0.8),
                      ],
                    )
                    : LinearGradient(
                      colors: [
                        Color(0xFF3A3A3A).withOpacity(0.3),
                        Color(0xFF2A2A2A).withOpacity(0.3),
                      ],
                    ),
            borderRadius: BorderRadius.circular(15),
            boxShadow:
                isActive
                    ? [
                      BoxShadow(
                        color: Color(0xFFD4AF37).withOpacity(0.4),
                        blurRadius: 15,
                        offset: Offset(0, 5),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ]
                    : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
            border: Border.all(
              color:
                  isActive
                      ? Color(0xFFD4AF37).withOpacity(0.5)
                      : Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.black87 : Colors.white,
              fontSize: 16,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              letterSpacing: 0.5,
              shadows:
                  isActive
                      ? []
                      : [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(0, 1),
                          blurRadius: 2,
                        ),
                      ],
            ),
          ),
        ),
      ),
    );
  }
}
