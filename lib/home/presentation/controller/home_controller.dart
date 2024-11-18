import 'dart:async';
import 'dart:developer';

import 'package:flutter_file_download/home/domain/use_cases/download_file_use_case.dart';

class HomeController {
  final DownloadFileUseCase downloadFileUseCase;

  HomeController(this.downloadFileUseCase);

  final _statusController = StreamController<Status?>.broadcast();

  Stream<Status?> get statusStream => _statusController.stream;

  Future<void> downloadFile() async {
    try {
      _statusController.add(Status.loading);
      await Future.delayed(const Duration(seconds: 1));
      await downloadFileUseCase.run();
      _statusController.add(Status.success);
    } catch (e) {
      log('Error: ${e.toString()}');
      _statusController.add(Status.failure);
    }
  }

  void dispose() {
    _statusController.close();
  }
}

enum Status {
  initial,
  loading,
  success,
  failure,
}
