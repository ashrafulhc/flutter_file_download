import 'package:dio/dio.dart';
import 'package:flutter_file_download/home/data/data_sources/file_downloader.dart';
import 'package:flutter_file_download/home/data/repositories/file_repository_impl.dart';
import 'package:flutter_file_download/home/domain/repositories/file_repository.dart';
import 'package:flutter_file_download/home/domain/use_cases/download_file_use_case.dart';
import 'package:flutter_file_download/home/presentation/controller/home_controller.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  // Register Dio (External library)
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Data Layer
  getIt
      .registerLazySingleton<FileDownloader>(() => FileDownloader(getIt.get()));

  getIt.registerLazySingleton<FileRepository>(
      () => FileRepositoryImpl(getIt.get()));

  // Domain Layer
  getIt.registerLazySingleton<DownloadFileUseCase>(
      () => DownloadFileUseCase(getIt.get()));

  // Presentation Layer
  getIt.registerFactory<HomeController>(() => HomeController(getIt.get()));
}
