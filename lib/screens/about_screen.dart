import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
            "About Me",
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8C6EFF),
            ),
          ),
          const SizedBox(height: 30),

          // Cards
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: const [
              InfoCard(
                title: "🎓 Education",
                items: [
                  "BCA – Shivaji University, Kolhapur (2020–2023)",
                  "HSC – Maharashtra State Board (2019–2020)",
                  "SSC – Maharashtra State Board (2017–2018)",
                ],
              ),
              InfoCard(
                title: "💼 Experience",
                items: [
                  "Flutter Developer Intern",
                  "AB Software, Pune",
                  "May 2023 – August 2023",
                  "Built UIs, integrated APIs, worked with designers",
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class InfoCard extends StatelessWidget {
  final String title;
  final List<String> items;

  const InfoCard({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 260,
      padding: const EdgeInsets.all(20),
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
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: items.map(
                    (item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    item,
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: (item.contains("BCA") ||
                          item.contains("HSC") ||
                          item.contains("SSC"))
                          ? FontWeight.w600
                          : FontWeight.normal,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
