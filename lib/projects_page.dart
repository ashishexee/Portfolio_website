import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Animate the header with fade and slide
            FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Interval(0.0, 0.4, curve: Curves.easeOut),
                ),
              ),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, -0.2),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Interval(0.0, 0.4, curve: Curves.easeOut),
                  ),
                ),
                child: Container(
                  width: double.infinity,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Projects',
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
              ),
            ),
            SizedBox(height: 40),

            // Animate the projects grid
            FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Interval(0.3, 0.7, curve: Curves.easeOut),
                ),
              ),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, 0.2),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Interval(0.3, 0.7, curve: Curves.easeOut),
                  ),
                ),
                child: Container(
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
                  child: _buildStaggeredProjectsGrid(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStaggeredProjectsGrid() {
    final projects = [
      {
        'title': 'JobLook',
        'subtitle': 'Job Searching Application',
        'githubRepo': 'https://api.github.com/repos/ashishexee/JobLook/readme',
        'color': Color(0xFF42A5F5),
        'isFlutterProject': true,
        'techStack': [
          'Flutter',
          'Node/Express.js',
          'MongoDb',
          'Firebase',
          'Provider',
        ],
        'githubLink': 'https://github.com/ashishexee/JobLook',
        'image': 'assets/joblook.png',
        'isleetcode': false,
      },
      {
        'title': 'TeleDrive',
        'subtitle': 'Cloud Storage Application',
        'githubRepo':
            'https://api.github.com/repos/ashishexee/TeleDrive/readme',
        'color': Color(0xFF2A2A2A),
        'isFlutterProject': true,
        'techStack': ['Flutter', 'Node/Express.js', 'MultiDr'],
        'githubLink': 'https://github.com/ashishexee/TeleDrive',
        'image': 'assets/teledrive.png',
        'isleetcode': false,
      },
      {
        'title': 'LeetCode Helper',
        'subtitle': 'VS Code extension for LeetCode',
        'githubRepo':
            'https://api.github.com/repos/ashishexee/cph-vscode-extension-leetcode/readme',
        'color': Color(0xFF9C27B0),
        'isFlutterProject': true,
        'techStack': ['TypeScript', 'VS Code Api', 'Puppeteer'],
        'githubLink':
            'https://github.com/ashishexee/cph-vscode-extension-leetcode',
        'image': 'assets/leetcode.png',
        'iconpath': 'assets/icons/vs.svg',
        'isleetcode': true,
      },
      {
        'title': 'SafeHer',
        'subtitle': 'Woman Safety Application',
        'githubRepo':
            'https://api.github.com/repos/ashishexee/women-safety-application/readme',
        'color': Color(0xFF4CAF50),
        'isFlutterProject': true,
        'techStack': [
          'Flutter',
          'Firebase',
          'Cloudnary',
          'Background Services',
        ],
        'githubLink': 'https://github.com/ashishexee/women-safety-application',
        'image': 'assets/safeher.png',
        'isleetcode': false,
      },
      {
        'title': 'Porfolio Website',
        'subtitle': 'Website using Flutter Web',
        'githubRepo':
            'https://api.github.com/repos/ashishexee/cph-vscode-extension-leetcode/readme',
        'color': Color(0xFFFF9800),
        'isFlutterProject': true,
        'techStack': ['Flutter', 'dart'],
        'githubLink': 'https://github.com/ashishexee/portfolio_website',
        'image': 'assets/portfolio.png',
        'isleetcode': false,
      },
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 25,
      mainAxisSpacing: 25,
      childAspectRatio: 0.85,
      children: List.generate(projects.length, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final delay = index * 0.2;
            final start = 0.4 + delay;
            final end = start + 0.4;

            final effectiveStart = start.clamp(0.0, 1.0);
            final effectiveEnd = end.clamp(0.0, 1.0);

            final cardAnimation = CurvedAnimation(
              parent: _controller,
              curve: Interval(
                effectiveStart,
                effectiveEnd,
                curve: Curves.easeOut,
              ),
            );

            return FadeTransition(
              opacity: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(cardAnimation),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, 0.3),
                  end: Offset.zero,
                ).animate(cardAnimation),
                child: child!,
              ),
            );
          },
          child: _buildProjectCard(
            projects[index]['title'] as String,
            projects[index]['subtitle'] as String,
            projects[index]['githubRepo'] as String,
            projects[index]['color'] as Color,
            projects[index]['techStack'] as List<String>,
            projects[index]['githubLink'] as String,
            Container(
              color: Colors.transparent,
              child: Image.asset(
                (projects[index]['image']).toString(),
                width: 200,
                height: 200,
                colorBlendMode: BlendMode.clear,
              ),
            ),
            projects[index]['isleetcode'] as bool,
            isFlutterProject:
                projects[index]['isFlutterProject'] as bool? ?? false,
            isCodeProject: projects[index]['isCodeProject'] as bool? ?? false,
            icon: SizedBox(
              height: 16,
              width: 16,
              child:
                  SvgPicture.asset(
                        (projects[index]['iconpath']).toString(),
                        fit: BoxFit.contain,
                        color: Color(0xFFD4AF37),
                      )
                      as Widget,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildProjectCard(
    String title,
    String subtitle,
    String githubRepo,
    Color color,
    List<String> techStack,
    String githubLink,
    Widget image,
    bool isleetcode, {
    Widget? icon,
    bool isFlutterProject = false,
    bool isCodeProject = false,
    bool hasScreens = false,
    bool isDarknetProject = false,
    bool isAudioProject = false,
  }) {
    return ProjectTile(
      projectTitle: title,
      githubRepo: githubRepo,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 1.0, end: 1.0),
        duration: Duration(milliseconds: 200),
        builder: (context, scale, child) {
          return Transform.scale(scale: scale, child: child);
        },
        child: Container(
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
                blurRadius: 15,
                offset: Offset(0, 8),
              ),
              BoxShadow(
                color: color.withOpacity(0.15),
                blurRadius: 25,
                offset: Offset(0, 0),
              ),
              BoxShadow(
                color: color.withOpacity(0.05),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, 0),
              ),
            ],
            border: Border.all(
              color: Color.lerp(Colors.white.withOpacity(0.1), color, 0.1)!,
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _getProjectBackgroundColor(
                      isFlutterProject,
                      isCodeProject,
                      isDarknetProject,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: _buildProjectContent(
                      image,
                      isFlutterProject,
                      isCodeProject,
                      hasScreens,
                      isDarknetProject,
                      isAudioProject,
                      color,
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF3A3A3A).withOpacity(0.5),
                        Color(0xFF2A2A2A).withOpacity(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    children: [
                      InkWell(
                        onTap: () {
                          Uri uri = Uri.parse(
                            'https://marketplace.visualstudio.com/items?itemName=leetcodehelper.leetcodehelperbyashish',
                          );
                          launchUrl(uri);
                        },
                        child: Row(
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.3,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.5),
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Spacer(),
                            Row(
                              children: [
                                icon!,
                                SizedBox(width: 4),
                                isleetcode == true
                                    ? Text(
                                      'MarketPlace',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFFD4AF37),
                                      ),
                                    )
                                    : SizedBox(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            subtitle,
                            style: TextStyle(
                              color: Color(0xFFD4AF37),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Uri uri = Uri.parse(githubLink);
                                launchUrl(uri);
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: 27,
                                width: 27,
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/github-svg.svg',
                                    fit: BoxFit.contain,
                                    color: Color(0xFFD4AF37),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 36.5,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: techStack.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 100,
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(
                                      0xFFD4AF37,
                                    ).withOpacity(0.8), // Rich gold color
                                    Color(
                                      0xFFFFD700,
                                    ).withOpacity(0.5), // Lighter gold color
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(17),
                                boxShadow: [
                                  BoxShadow(
                                    color: color.withOpacity(0.3),
                                    blurRadius: 4,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                  width: 0.5,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  techStack[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color _getProjectBackgroundColor(bool isFlutter, bool isCode, bool isDarknet) {
  if (isFlutter) return Colors.white;
  if (isCode) return Color(0xFF1A1A1A);
  if (isDarknet) return Color(0xFF8B0000);
  return Color(0xFF3A3A3A);
}

Widget _buildProjectContent(
  Widget image,
  bool isFlutter,
  bool isCode,
  bool hasScreens,
  bool isDarknet,
  bool isAudio,
  Color color,
) {
  if (isFlutter) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Color(0xFFF5F9FF), Color(0xFFE8F4FF)],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Background subtle pattern
          Positioned.fill(child: Opacity(opacity: 0.05, child: Container())),
          // Glass effect accent
          Positioned(
            top: -30,
            right: -30,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [color.withOpacity(0.15), color.withOpacity(0.0)],
                ),
              ),
            ),
          ),
          // Main content - Simplified to avoid unnecessary nesting
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: image,
              ),
            ),
          ),
          // Subtle shine effect
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.3),
                    Colors.white.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  return Container();
}

class ProjectTile extends StatefulWidget {
  final String projectTitle;
  final String githubRepo;
  final Widget child;

  // Static variable to track the currently active overlay across all instances
  static OverlayEntry? _currentActiveOverlay;

  const ProjectTile({
    super.key,
    required this.projectTitle,
    required this.githubRepo,
    required this.child,
  });

  @override
  State<ProjectTile> createState() => _ProjectTileState();
}

class _ProjectTileState extends State<ProjectTile>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  bool _isHovering = false;
  String? _readmeContent;
  bool _loading = false;
  OverlayEntry? _overlayEntry;
  bool _isOverReadme = false;
  bool _disposed = false;

  // Animation controller
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  // ignore: unused_field
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _elevationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _disposed = true;
    _animationController.dispose();
    _hideOverlay();
    super.dispose();
  }

  Future<void> fetchReadme() async {
    if (_disposed) return;
    setState(() => _loading = true);
    try {
      final uri = Uri.parse(widget.githubRepo);
      final response = await http.get(uri);
      print(response.body);

      if (_disposed) return;

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        String encodedContent = data['content']
            .replaceAll('\n', '')
            .replaceAll('\r', '');
        final content = utf8.decode(base64.decode(encodedContent));
        setState(() {
          _readmeContent = content;
          _loading = false;
        });
        _overlayEntry?.markNeedsBuild();
      } else {
        setState(() {
          _readmeContent = 'Failed to load README for ${widget.projectTitle}';
          _loading = false;
        });
        // Update overlay if it exists
        _overlayEntry?.markNeedsBuild();
      }
    } catch (e) {
      if (_disposed) return;
      setState(() {
        _readmeContent = 'Error: $e';
        _loading = false;
      });
      _overlayEntry?.markNeedsBuild();
    }
  }

  void _showOverlay(BuildContext context) {
    // Safety check for context
    if (!mounted || _disposed) return;

    // First handle any existing overlay
    _removeGlobalOverlay();

    final overlay = Overlay.of(context);

    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;

    // Width of README box
    final readmeWidth = 550.0;

    // Check if README would extend beyond screen edge
    final wouldOverflowRight =
        (offset.dx + size.width + readmeWidth) > screenWidth;

    // Position the README box based on available space
    final leftPosition =
        wouldOverflowRight
            ? offset.dx -
                readmeWidth // Place on left if it would overflow
            : offset.dx + size.width; // Otherwise place on right

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: leftPosition,
          top: offset.dy,
          child: MouseRegion(
            onEnter: (_) => _isOverReadme = true,
            onExit: (_) {
              _isOverReadme = false;
              _hideOverlayIfNeeded();
            },
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: readmeWidth,
                height: 300,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Color(0xFFD4AF37).withOpacity(0.3),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 15,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child:
                    _loading
                        ? const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFFD4AF37),
                            ),
                          ),
                        )
                        : SingleChildScrollView(
                          child: Markdown(
                            data: _readmeContent ?? "Loading README...",
                            styleSheet: MarkdownStyleSheet(
                              h1: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              h2: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              h3: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              p: TextStyle(color: Colors.white),
                              code: TextStyle(
                                backgroundColor: Colors.black45,
                                color: Colors.white,
                              ),
                              codeblockDecoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            shrinkWrap: true,
                          ),
                        ),
              ),
            ),
          ),
        );
      },
    );

    try {
      overlay.insert(_overlayEntry!);
      // Save reference to current active overlay
      ProjectTile._currentActiveOverlay = _overlayEntry;
    } catch (e) {
      // Handle insertion error gracefully
      _overlayEntry = null;
    }
  }

  // Remove the global overlay if it exists
  void _removeGlobalOverlay() {
    if (ProjectTile._currentActiveOverlay != null) {
      try {
        ProjectTile._currentActiveOverlay!.remove();
      } catch (e) {
        // Silently handle any errors when removing global overlay
      } finally {
        ProjectTile._currentActiveOverlay = null;
      }
    }
  }

  void _hideOverlayIfNeeded() {
    if (_disposed) return;

    if (!_isHovering && !_isOverReadme) {
      _hideOverlay();
    }
  }

  void _hideOverlay() {
    if (_disposed) return;

    if (_overlayEntry != null) {
      try {
        if (ProjectTile._currentActiveOverlay == _overlayEntry) {
          _overlayEntry!.remove();
          ProjectTile._currentActiveOverlay = null;
        }
      } catch (e) {
        // Silently handle any errors when removing
      } finally {
        _overlayEntry = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: MouseRegion(
            onEnter: (event) {
              if (_disposed) return;
              _animationController.forward();

              if (_readmeContent == null && !_loading) {
                fetchReadme();
              }
              setState(() => _isHovering = true);

              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted && _isHovering && !_disposed) {
                  _showOverlay(context);
                }
              });
            },
            onExit: (event) {
              if (_disposed) return;
              _animationController.reverse();

              setState(() => _isHovering = false);

              Future.delayed(Duration(milliseconds: 100), () {
                if (!_disposed) {
                  _hideOverlayIfNeeded();
                }
              });
            },
            child: CompositedTransformTarget(
              link: _layerLink,
              child: widget.child,
            ),
          ),
        );
      },
    );
  }
}