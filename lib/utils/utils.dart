import 'package:flutter/material.dart';
import 'package:qrreader/providers/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future launcherURLUtils(BuildContext context, ScanModel scan) async {
  final url = scan.valor;
  print(scan.tipo);
  if (scan.tipo == 'http') {
    //Abrir el sitio web
    if (!await launchUrlString(url)) {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
