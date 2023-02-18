import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/scan_list_provider.dart';
import 'package:qrreader/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;
  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .borrarScanPorTipo(scans[i].id!);
        },
        child: ListTile(
          leading: Icon(
            tipo == 'geo' ? Icons.map_sharp : Icons.compass_calibration,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: () => launcherURLUtils(context, scans[i]),
        ),
      ),
    );
  }
}
