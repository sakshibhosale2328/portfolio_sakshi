import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

void downloadResume() async {
  final byteData = await rootBundle.load('assets/sakshi bhosale.pdf');
  final buffer = byteData.buffer;
  final directory = await getTemporaryDirectory();
  final filePath = '${directory.path}/sakshi bhosale.pdf';
  File file = File(filePath);
  await file.writeAsBytes(buffer.asUint8List());
  await OpenFile.open(file.path);
}
