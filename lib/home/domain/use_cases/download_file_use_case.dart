import 'package:flutter_file_download/home/domain/repositories/file_repository.dart';

class DownloadFileUseCase {
  final FileRepository repository;

  DownloadFileUseCase(this.repository);

  Future<void> run() async {
    await repository.downloadFile();
  }
}
