import 'package:flutter/material.dart';

class ScreenshotViewer extends StatelessWidget {
  final List<String> screenshots;
  final String title;

  const ScreenshotViewer({
    super.key,
    required this.screenshots,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('$title Screenshots'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: screenshots.length,
        itemBuilder: (context, index) {
          return Center(
            child: InteractiveViewer(
              panEnabled: true,
              minScale: 0.8,
              maxScale: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  screenshots[index],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
