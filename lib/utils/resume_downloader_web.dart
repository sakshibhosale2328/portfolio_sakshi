import 'dart:html' as html;
void _downloadResumeWeb() {
  const url = 'assets/Sakshi  (1).pdf';
  html.AnchorElement anchorElement = html.AnchorElement(href: url)
    ..target = 'blank'
    ..download = 'Sakshi_Resume.pdf'
    ..click();
}

