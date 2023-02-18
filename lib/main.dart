import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/scan_list_provider.dart';
import 'package:qrreader/providers/ui_provider.dart';
import 'package:qrreader/screens/home_page.dart';
import 'package:qrreader/screens/mapa_page.dart';
import 'package:qrreader/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'QR Reader',
          initialRoute: 'home',
          routes: {
            'home': (_) => const HomePage(),
            'mapa': (_) => const MapaPage(),
          },
          theme: ThemeApp.themeData),
    );
  }
}
