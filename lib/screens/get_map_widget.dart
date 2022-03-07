import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart';

Widget getMap() {
  String htmlId = "7";
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final myLatlng = LatLng(-9.747242740009787, -36.66890764519393);

    final mapOptions = MapOptions()
      ..zoom = 10
      ..center = LatLng(-9.747242740009787, -36.66890764519393);

    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%"
      ..style.border = 'none';

    final map = GMap(elem, mapOptions);

    Marker(MarkerOptions()
      ..position = myLatlng
      ..map = map
      ..title = 'Ginásio da Escola Pedro Reis');

    return elem;
  });

  return HtmlElementView(viewType: htmlId);
}
