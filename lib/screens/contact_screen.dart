import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

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
            "Contact Me",
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8C6EFF),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: 400,
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
                _contactItem(

                  text: "Get in Touch ",
                ),
                _contactItem(
                  icon: Icons.email,
                  text: "sakshibhosale2328@gmail.com",
                ),
                _contactItem(
                  icon: Icons.location_on,
                  text: "Pune, Maharashtra",
                ),
                _contactItem(
                  icon: FontAwesomeIcons.linkedin,
                  text: "LinkedIn Profile",
                  onTap: () => _launchUrl("https://www.linkedin.com/in/sakshi-bhosale-02a49b2b1?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app "),
                ),
                _contactItem(
                  icon: FontAwesomeIcons.github,
                  text: "GitHub Profile",
                  onTap: () => _launchUrl("https://github.com/sakshibhosale2328"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),



        ],
      ),
    );
  }

  Widget _contactItem({
    IconData? icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null) ...[
              Icon(icon, color: const Color(0xFF8C6EFF)),
              const SizedBox(width: 10),
            ],
            Flexible(
              child: Text(
                text,
                style: GoogleFonts.openSans(
                  fontSize: icon == null ? 16 : 13.5,
                  fontWeight: icon == null ? FontWeight.bold : FontWeight.normal,
                  color: Colors.black87,
                  decoration: onTap != null ? TextDecoration.underline : TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
