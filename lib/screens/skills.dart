import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SkillsSection extends StatelessWidget {
  SkillsSection({super.key});

  final List<_Skill> skills = const [
    _Skill(icon: LucideIcons.smartphone, label: 'Flutter & Dart'),
    _Skill(icon: LucideIcons.database, label: 'Firebase'),
    _Skill(icon: LucideIcons.globe, label: 'RESTful APIs'),
    _Skill(icon: LucideIcons.settings, label: 'State Management'),
    _Skill(icon: LucideIcons.gitBranch, label: 'Git & GitHub'),
    _Skill(icon: LucideIcons.cloud, label: 'Cloud Services'),
  ];

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
            "Skills",
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
            children: skills.map((skill) => _SkillCard(skill: skill)).toList(),
          ),
        ],
      ),
    );
  }
}

class _Skill {
  final IconData icon;
  final String label;

  const _Skill({required this.icon, required this.label});
}

class _SkillCard extends StatefulWidget {
  final _Skill skill;

  const _SkillCard({required this.skill});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(_) => setState(() => _scale = 0.95);
  void _onTapUp(_) => setState(() => _scale = 1.0);
  void _onTapCancel() => setState(() => _scale = 1.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: () {

      },
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        child: Container(
          width: 120,
          height: 150,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF8C6EFF),
                      Color(0xFFD1C2FF),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Icon(
                    widget.skill.icon,
                    size: 26,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.skill.label,
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF202124),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
