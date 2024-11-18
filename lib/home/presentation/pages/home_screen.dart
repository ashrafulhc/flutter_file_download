import 'package:flutter/material.dart';
import 'package:flutter_file_download/home/presentation/controller/home_controller.dart';
import 'package:flutter_file_download/injection/injector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = getIt.get<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.statusStream.listen((status) {
      if (!mounted) return;
      
      if (status == Status.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('File downloaded successfully!')),
        );
      } else if (status == Status.failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to download file!')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: StreamBuilder<Status?>(
        stream: controller.statusStream,
        initialData: Status.initial,
        builder: (context, snapshot) {
          final status = snapshot.data;

          // Show loading indicator while downloading
          if (status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return const Center(
            child: Text('Press the button to download.'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.downloadFile,
        child: const Icon(Icons.download),
      ),
    );
  }
}
