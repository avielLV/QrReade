import 'package:flutter/material.dart';
import 'package:qrreader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    //Asignar el ID de la base de datos al modelo
    nuevoScan.id = id;
    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getTodoLosScanas();
    this.scans = [...?scans];
    notifyListeners();
  }

  cargarScansPotTipo(String tipo) async {
    final scans = await DBProvider.db.getScansPorTipo(tipo);
    this.scans = [...?scans];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodo() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  borrarScanPorTipo(int id) async {
    await DBProvider.db.deleteScan(id);
    // cargarScansPotTipo(tipoSeleccionado);
  }
}