// import 'dart:html' as html;
// void _downloadResumeWeb() {
//   const url = 'assets/Sakshi  (1).pdf';
//   html.AnchorElement anchorElement = html.AnchorElement(href: url)
//     ..target = 'blank'
//     ..download = 'Sakshi_Resume.pdf'
//     ..click();
// }

// import 'dart:html' as html;
// import 'dart:ui_web' as ui;
//
// void downloadResume() {
//   const assetPath = 'assets/Sakshi  (1).pdf';
//
//   final url = ui.AssetManager().getAssetUrl(assetPath);
//   final anchor = html.AnchorElement(href: url)
//     ..target = 'blank'
//     ..download = 'Sakshi_Resume.pdf'
//     ..click();
// }

import 'dart:html' as html;
import 'dart:ui_web' as ui;

void downloadResume() {
  const assetPath = 'assets/sakshi bhosale.pdf.pdf';
  final url = ui.AssetManager().getAssetUrl(assetPath);
  html.AnchorElement(href: url)
    ..download = 'Sakshi_Resume.pdf'
    ..target = 'blank'
    ..click();
}