import 'package:flutter_file_download/home/data/data_sources/file_downloader.dart';
import 'package:flutter_file_download/home/domain/repositories/file_repository.dart';

class FileRepositoryImpl implements FileRepository {
  final FileDownloader fileDownloader;

  FileRepositoryImpl(this.fileDownloader);

  @override
  Future<void> downloadFile() async {
    await fileDownloader.downloadFile();
  }
}
