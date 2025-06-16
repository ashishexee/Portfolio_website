import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullname = TextEditingController();
    TextEditingController emailAddress = TextEditingController();
    TextEditingController message = TextEditingController();
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
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
                        'Contact Form',
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
                    ],
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: 270,
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

                  Row(
                    children: [
                      Expanded(child: _buildTextField(fullname, 'Full Name')),
                      SizedBox(width: 20),
                      Expanded(
                        child: _buildTextField(emailAddress, 'Email address'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildTextField(message, 'Your Message', maxLines: 6),
                  SizedBox(height: 30),

                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      splashColor: Colors.yellow,
                      hoverColor: Colors.yellow,
                      onTap: () async {
                        if (fullname.text.isEmpty == true ||
                            message.text.isEmpty == true ||
                            emailAddress.text.isEmpty == true) {
                          Fluttertoast.showToast(
                            msg: 'Please fill the all fields',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                            webPosition: "center",
                          );
                        } else {
                          Future.delayed(Duration(milliseconds: 300), () {
                            Fluttertoast.showToast(
                              msg: 'Message Send!!',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.yellow,
                              textColor: Colors.white,
                              fontSize: 16.0,
                              webPosition: "center",
                            );
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
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
                                color: Colors.black.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: SizedBox(
                                height: 27,
                                width: 27,
                                child: SvgPicture.asset(
                                  'assets/icons/message.svg',
                                  fit: BoxFit.contain,
                                  colorBlendMode: BlendMode.darken,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Send Message',
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
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hint, {
    int maxLines = 1,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Color(0xFFD4AF37).withOpacity(0.2),
        hoverColor: Color(0xFFD4AF37).withOpacity(0.1),
        child: Container(
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
                color: Colors.white.withOpacity(0.05),
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
            border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
          ),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 0.3,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
                letterSpacing: 0.3,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: maxLines > 1 ? 20 : 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GoogleMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Draw green areas (parks/forests) with enhanced colors
    paint.color = Color(0xFFB8E6B8);
    paint.style = PaintingStyle.fill;

    // Top green area
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width * 0.3, size.height * 0.4),
      paint,
    );

    // Bottom right green area
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.6,
        size.height * 0.6,
        size.width * 0.4,
        size.height * 0.4,
      ),
      paint,
    );

    // Draw roads with enhanced styling
    paint.color = Colors.white;
    paint.strokeWidth = 3;
    paint.style = PaintingStyle.stroke;

    // Main horizontal road
    canvas.drawLine(
      Offset(0, size.height * 0.4),
      Offset(size.width, size.height * 0.45),
      paint,
    );

    // Vertical roads
    canvas.drawLine(
      Offset(size.width * 0.3, 0),
      Offset(size.width * 0.32, size.height),
      paint,
    );

    canvas.drawLine(
      Offset(size.width * 0.6, 0),
      Offset(size.width * 0.58, size.height),
      paint,
    );

    // Highway (enhanced orange line)
    paint.color = Color(0xFFFFB347);
    paint.strokeWidth = 5;
    canvas.drawLine(
      Offset(0, size.height * 0.4),
      Offset(size.width, size.height * 0.4),
      paint,
    );

    // Draw smaller roads with better visibility
    paint.color = Colors.grey[300]!;
    paint.strokeWidth = 1.5;

    for (int i = 1; i < 10; i++) {
      canvas.drawLine(
        Offset(0, (size.height / 10) * i),
        Offset(size.width, (size.height / 10) * i),
        paint,
      );
    }

    for (int i = 1; i < 15; i++) {
      canvas.drawLine(
        Offset((size.width / 15) * i, 0),
        Offset((size.width / 15) * i, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
