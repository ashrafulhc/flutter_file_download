import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class FileDownloader {
  final Dio dio;

  FileDownloader(this.dio);

  Future<void> downloadFile() async {
    log('Downloading Initiated');

    final dir = Platform.isAndroid
        ? Directory('/storage/emulated/0/Download')
        : await getApplicationDocumentsDirectory();

    const filename = 'dummy1.pdf';

    final path = '${dir.path}/$filename';

    log('File Name: $path');

    String baseUrl =
        "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf";

    await dio.download(baseUrl, path);
  }
}
