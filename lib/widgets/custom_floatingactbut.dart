import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/scan_list_provider.dart';
import 'package:qrreader/utils/utils.dart';

class CustomFloatActBut extends StatelessWidget {
  const CustomFloatActBut({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        //linea para probar el reader de maps
        // String barcodeScanRes = 'geo:11.761876,-70.182666';

        //linea para probar el reader de url
        // String barcodeScanRes = 'https://pub.dev/';
        print('-------- $barcodeScanRes');
        if (barcodeScanRes == '-1') {
          return;
        }
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        launcherURLUtils(context, nuevoScan);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
