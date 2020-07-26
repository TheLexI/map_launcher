import 'package:flutter/material.dart';
import 'package:map_launcher/src/map_launcher.dart';
import 'package:map_launcher/src/svg_provider.dart';
import 'package:map_launcher/src/utils.dart';

enum MapType {
  apple,
  google,
  amap,
  baidu,
  waze,
  yandexNavi,
  yandexMaps,
  citymapper,
  mapswithme,
  osmand,
}

enum DirectionsMode {
  driving,
  walking,
  transit,
  bicycling,
}

class Coords {
  final double latitude;
  final double longitude;

  Coords(this.latitude, this.longitude);
}

class AvailableMap {
  String mapName;
  MapType mapType;
  ImageProvider icon;

  AvailableMap({this.mapName, this.mapType, this.icon});

  static AvailableMap fromJson(json) {
    return AvailableMap(
      mapName: json['mapName'],
      mapType: Utils.enumFromString(MapType.values, json['mapType']),
      icon: SvgImage(
        'assets/icons/${json['mapType']}.svg',
        package: 'map_launcher',
      ),
    );
  }

  Future<void> showMarker({
    @required Coords coords,
    @required String title,
    @required String description,
  }) {
    return MapLauncher.showMarker(
      mapType: mapType,
      coords: coords,
      title: title,
      description: description,
    );
  }

  Future<void> showDirections({
    @required Coords destination,
    String destinationTitle,
    Coords origin,
    String originTitle,
    DirectionsMode directionsMode,
  }) {
    return MapLauncher.showDirections(
      mapType: mapType,
      destination: destination,
      destinationTitle: destinationTitle,
      origin: origin,
      originTitle: originTitle,
      directionsMode: directionsMode,
    );
  }

  @override
  String toString() {
    return 'AvailableMap { mapName: $mapName, mapType: ${Utils.enumToString(mapType)} }';
  }
}