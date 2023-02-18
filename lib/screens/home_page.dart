import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/db_provider.dart';
import 'package:qrreader/providers/scan_list_provider.dart';
import 'package:qrreader/providers/scan_list_provider.dart';
import 'package:qrreader/providers/ui_provider.dart';
import 'package:qrreader/screens/direcciones_page.dart';
import 'package:qrreader/screens/mapas_page.dart';
import 'package:qrreader/widgets/custom_floatingactbut.dart';
import 'package:qrreader/widgets/custom_navigatorbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarTodo();
              },
              icon: const Icon(Icons.delete_forever_rounded))
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButton: const CustomFloatActBut(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    //Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);
    //Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;
    //Usar el ScanListProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPotTipo('geo');
        return const MapasPage();
      case 1:
        scanListProvider.cargarScansPotTipo('http');
        return const DireccionesPage();
      default:
        return const MapasPage();
    }
  }
}
