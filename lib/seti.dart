import 'package:flutter/widgets.dart';
import 'data.dart';

class SetiIcon extends StatelessWidget {
  final String fileName;
  final bool light;
  final double size;

  SetiIcon(String fileName, {this.light = false, this.size})
      : this.fileName = fileName.toLowerCase();

  @override
  Widget build(BuildContext context) {
    final meta = light ? setiLightMeta : setiMeta;
    String key;

    if (meta['names'].containsKey(fileName)) {
      key = meta['names'][fileName];
    } else {
      var ext = fileName.split('.').last;
      if (meta['extensions'].containsKey(ext)) {
        key = meta['extensions'][ext];
      }
    }

    if (key == null) return null;
    return iconDefinitions[key];
  }
}
