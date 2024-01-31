import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_database/db/db_helper.dart';
import 'package:local_database/pages/create/bindings.dart';
import 'package:local_database/pages/create/create.dart';
import 'package:local_database/pages/home/bindings.dart';
import 'package:local_database/pages/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      initialBinding: HomeBindings(),
      getPages: [
        GetPage(
            name: "/", page: () => const HomePage(), binding: HomeBindings()),
        GetPage(
            name: "/create",
            page: () => const CreatePage(),
            binding: CreateBindings()),
      ],
    );
  }
}
