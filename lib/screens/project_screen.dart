import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant/screenshot.dart';
import 'screenshot_viewer.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F3FF),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Projects",
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8C6EFF),
            ),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              ProjectCard(
                title: "🌦 Weather App",
                description:
                "A Flutter app that fetches real-time weather data using OpenWeatherMap API. Supports location and city search.",
                githubLink:
                "https://github.com/sakshibhosale2328/portfolio_sakshi.git",
                screenshots: ProjectScreenshots.weatherApp,
                languages: 'Flutter • Dart • API Integration • Weather API',
              ),
              ProjectCard(
                title: "⚖️ BMI Calculator App",
                description:
                "A simple and responsive Flutter app that calculates Body Mass Index (BMI) based on user input for weight and height. It displays results with health categories and provides a clean, user-friendly interface.",
                githubLink: "https://github.com/sakshibhosale2328/bmi_calculator.git",
                screenshots: ProjectScreenshots.bmiApp,
                languages: 'Flutter • Dart • setState • UI Design',
              ),

              ProjectCard(
                title: "📅 Attendify (Intern Project)",
                description:
                "Real-time attendance tracker with secure login and leave request features. Built during Flutter internship.",
                githubLink: "https://github.com/sakshibhosale2328/attendify.git",
                screenshots: ProjectScreenshots.attendifyApp,
                languages:
                'Flutter • Backend Integration • Auth • Real-time UI',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String languages;
  final String githubLink;
  final List<String> screenshots;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.githubLink,
    required this.screenshots,
    required this.languages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 380,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF202124),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.openSans(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),

          // Language chips
          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: languages
                .split('•')
                .map(
                  (lang) => Chip(
                label: Text(lang.trim()),
                labelStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.deepPurple,
                ),
                backgroundColor: const Color(0xFFEDE9FE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ),
            )
                .toList(),
          ),

          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse(githubLink);
                  if (githubLink != "#" && await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8C6EFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("🔗 GitHub"),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ScreenshotViewer(
                          screenshots: screenshots,
                          title: title,
                        ),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF8C6EFF)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "🖼 View Screenshot",
                    style: TextStyle(
                      color: Color(0xFF8C6EFF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
