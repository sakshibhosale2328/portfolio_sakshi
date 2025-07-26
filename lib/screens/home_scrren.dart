import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled9/screens/project_screen.dart';
import 'package:untitled9/screens/skills.dart';
import 'about_screen.dart';
import 'contact_screen.dart';

import 'package:untitled9/utils/resume_downloader.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  String _activeButton = "";

  void _scrollToSection(GlobalKey key, String button) {
    setState(() {
      _activeButton = button;
    });

    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _downloadResume() {
    downloadResume();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FF),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 600,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF8C6EFF),
                            Color(0xFF5D5FEF),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: const CircleAvatar(
                          radius: 58,
                          backgroundImage: AssetImage('assets/images/My_img.jpg'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      "Sakshi Bhosale",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF8C6EFF),
                      ),
                    ),

                    const SizedBox(height: 8),
                    Text(
                      "Flutter Developer 💜",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: const Color(0xFF8C6EFF),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text.rich(
                      TextSpan(
                        style: GoogleFonts.openSans(
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                        children: const [
                          TextSpan(text: "I'm a "),
                          TextSpan(
                            text: "motivated and enthusiastic ",
                            style: TextStyle(color: Color(0xFF3B82F6)),
                          ),
                          TextSpan(
                              text:
                              "Flutter developer with a strong foundation in programming languages and modern development tools. I'm seeking a position in a "),
                          TextSpan(
                            text: "growth-oriented company ",
                            style: TextStyle(color: Color(0xFF3B82F6)),
                          ),
                          TextSpan(
                              text:
                              "where I can apply my technical skills, expand my knowledge, and contribute to innovative mobile app solutions."),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "💡 Passionate about continuous learning 💡",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 30),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _downloadResume,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8C6EFF),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text("📄 Download Resume"),
                        ),
                        OutlinedButton(
                          onPressed: () =>
                              _scrollToSection(_projectsKey, "projects"),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: _activeButton == "projects"
                                ? const Color(0xFF8C6EFF).withOpacity(0.2)
                                : Colors.transparent,
                            side: BorderSide(
                              color: const Color(0xFF8C6EFF),
                            ),
                          ),
                          child: Text(
                            "📁 View Projects",
                            style: TextStyle(
                              color: const Color(0xFF8C6EFF),
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () =>
                              _scrollToSection(_contactKey, "contact"),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: _activeButton == "contact"
                                ? const Color(0xFF8C6EFF).withOpacity(0.2)
                                : Colors.transparent,
                            side: BorderSide(
                              color: const Color(0xFF8C6EFF),
                            ),
                          ),
                          child: Text(
                            "📬 Contact Me",
                            style: TextStyle(
                              color: const Color(0xFF8C6EFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          StatCard(label: "Projects Completed", value: "3+"),
                          SizedBox(width: 16),
                          StatCard(label: "Technologies Mastered", value: "6+"),
                          SizedBox(width: 16),
                          StatCard(label: "Internship Experience", value: "1"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const AboutSection(),
              const SizedBox(height: 40),
              ProjectsSection(key: _projectsKey),
              const SizedBox(height: 40),
              SkillsSection(),
              const SizedBox(height: 40),
              ContactSection(key: _contactKey),
            ],
          ),
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String label;
  final String value;

  const StatCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF8C6EFF),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
