import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Premium Resume Header with Download Button
            Container(
              padding: EdgeInsets.all(25),
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
                  // Left side - Resume title and underline
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Resume',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Color(0xFFD4AF37).withOpacity(0.5),
                                offset: Offset(0, 2),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          width: 160,
                          height: 4,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFD4AF37),
                                Color(0xFFD4AF37).withOpacity(0.3),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFD4AF37).withOpacity(0.5),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                    child: InkWell(
                      onTap: () {
                        _downloadCV(context);
                      },
                      splashColor: Color(0xFFD4AF37).withOpacity(0.2),
                      hoverColor: Color(0xFFD4AF37).withOpacity(0.1),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFD4AF37),
                              Color(0xFFD4AF37).withOpacity(0.8),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
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
                          ],
                          border: Border.all(
                            color: Color(0xFFD4AF37).withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(color: Colors.transparent),
                                ],
                              ),
                              child: Icon(
                                Icons.download,
                                color: Colors.black87,
                                size: 24,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Download CV',
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            // Premium Skills Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(30),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What I work with',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Color(0xFFD4AF37).withOpacity(0.5),
                          offset: Offset(0, 2),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: 245,
                    height: 4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFD4AF37),
                          Color(0xFFD4AF37).withOpacity(0.3),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFD4AF37).withOpacity(0.5),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  Column(
                    children: [
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          _buildSkillItem(
                            Container(
                              height: 50,
                              width: 50,
                              padding: EdgeInsets.all(8),
                              color: Colors.transparent,
                              child: SvgPicture.asset(
                                'assets/icons/flutter1.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            'Flutter',
                            Color(0xFF42A5F5),
                          ),
                          _buildSkillItem(
                            Container(
                              height: 50,
                              width: 50,
                              padding: EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                'assets/icons/dart.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            'Dart',
                            Color(0xFF0175C2),
                          ),
                          _buildSkillItem(
                            Container(
                              height: 50,
                              width: 50,
                              padding: EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                'assets/icons/nodejs1.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            'Node.js',
                            Colors.green,
                          ),
                          _buildSkillItem(
                            Container(
                              height: 50,
                              width: 50,
                              padding: EdgeInsets.all(5),
                              color: Colors.transparent,
                              child: SvgPicture.asset(
                                'assets/icons/javascript1.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            'JavaScript',
                            Color(0xFFF7DF1E),
                          ),
                          _buildSkillItem(
                            Container(
                              height: 50,
                              width: 50,
                              color: Colors.transparent,
                              child: SvgPicture.asset(
                                'assets/icons/mongodb.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            'MongoDb',
                            Colors.white,
                          ),
                          _buildSkillItem(
                            Container(
                              padding: EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                'assets/icons/firebase.svg',
                              ),
                            ),
                            'Firebase',
                            Color(0xFFFF6F00),
                          ),
                          _buildSkillItem(
                            Container(
                              padding: EdgeInsets.all(8),
                              child: SvgPicture.asset('assets/icons/figma.svg'),
                            ),
                            'Figma',
                            Color(0xFFE91E63),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          _buildSkillItem(
                            Container(
                              padding: EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                'assets/icons/expressjs.svg',
                                color: Colors.yellow,
                              ),
                            ),
                            'Express.js',
                            Color.fromARGB(255, 205, 198, 0),
                          ),
                          _buildSkillItem(
                            SvgPicture.asset('assets/icons/typescript.svg'),
                            'TypeScript',
                            Color(0xFF61DAFB),
                          ),
                          _buildSkillItem(
                            Container(
                              padding: EdgeInsets.all(6),
                              child: SvgPicture.asset('assets/icons/c.svg'),
                            ),
                            'C++',
                            Colors.blue,
                          ),
                          _buildSkillItem(
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset('assets/icons/canva.svg'),
                            ),
                            'Canva',
                            Colors.blueAccent,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 55),
            // Premium Education Section
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF3A3A3A).withOpacity(0.8),
                    Color(0xFF2A2A2A).withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    offset: Offset(0, 8),
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.05),
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
                border: Border.all(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFD4AF37),
                                Color(0xFFD4AF37).withOpacity(0.8),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFD4AF37).withOpacity(0.4),
                                blurRadius: 12,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Education',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Color(0xFFD4AF37).withOpacity(0.3),
                              offset: Offset(0, 1),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  _buildEducationItem(
                    'Indian Institute of Technology, Roorkee',
                    '2024 - 2027',
                    'Currently pursuing B.Tech in Production and Industrial Engineering. Currently in 3rd year with expected graduation in 2027. Focusing on manufacturing processes, quality control, and industrial optimization.',
                  ),
                  SizedBox(height: 25),
                  _buildEducationItem(
                    'Modern School',
                    '2022 - 2024',
                    'Completed higher secondary education with excellent academic performance. Built strong foundation in Mathematics, Physics, and Chemistry which led to successful admission in IIT Roorkee.',
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),

            // Premium Experience Section
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF3A3A3A).withOpacity(0.8),
                    Color(0xFF2A2A2A).withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    offset: Offset(0, 8),
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.05),
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
                border: Border.all(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFD4AF37),
                              Color(0xFFD4AF37).withOpacity(0.8),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFD4AF37).withOpacity(0.4),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Experience',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Color(0xFFD4AF37).withOpacity(0.3),
                              offset: Offset(0, 1),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  _buildExperienceItem(
                    'Flutter Developer - Freelance',
                    'Jan 2024 - Present',
                    'Developing mobile applications using Flutter while pursuing my engineering degree. Created responsive mobile apps with clean UI/UX design and efficient backend integration.',
                  ),
                  SizedBox(height: 25),
                  _buildExperienceItem(
                    'Technical Projects - IIT Roorkee',
                    'Aug 2024 - Present',
                    'Working on various technical projects related to production engineering and mobile app development. Combining industrial engineering concepts with modern technology solutions.',
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void _downloadCV(BuildContext context) {
    Uri uri = Uri.parse(
      "https://drive.google.com/file/d/1uJ5I8sPXnYxH8AdbiBqzMtxuQPS4WepV/view?usp=drivesdk",
    );
    launchUrl(uri);
  }

  Widget _buildEducationItem(String title, String period, String description) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2A2A2A), Color(0xFF1F1F1F)],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: Color(0xFFD4AF37).withOpacity(0.2), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: EdgeInsets.only(top: 6, right: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFD4AF37), Color(0xFFD4AF37).withOpacity(0.8)],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFD4AF37).withOpacity(0.5),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  period,
                  style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 14,
                    height: 1.5,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(
    String company,
    String period,
    String description,
  ) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2A2A2A), Color(0xFF1F1F1F)],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: Color(0xFFD4AF37).withOpacity(0.2), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: EdgeInsets.only(top: 6, right: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFD4AF37), Color(0xFFD4AF37).withOpacity(0.8)],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFD4AF37).withOpacity(0.5),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  company,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  period,
                  style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 14,
                    height: 1.5,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillItem(Widget icon, String name, Color color) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF3A3A3A).withOpacity(0.8),
            Color(0xFF2A2A2A).withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, 0),
          ),
        ],
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          splashColor: color.withOpacity(0.3),
          hoverColor: color.withOpacity(0.1),
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color.withOpacity(0.3), color.withOpacity(0.1)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: icon,
                ),
                SizedBox(height: 12),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
