import 'package:flutter/material.dart';
import 'package:map_launcher/src/map_launcher.dart';
import 'package:map_launcher/src/utils.dart';

enum MapType {
  apple,
  google,
  googleGo,
  amap,
  baidu,
  waze,
  yandexMaps,
  yandexNavi,
  citymapper,
  mapswithme,
  osmand,
  doubleGis,
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
  String icon;

  AvailableMap({this.mapName, this.mapType, this.icon});

  static AvailableMap fromJson(json) {
    return AvailableMap(
      mapName: json['mapName'],
      mapType: Utils.enumFromString(MapType.values, json['mapType']),
      icon: '${json['mapType']}.svg',
    );
  }

  Future<void> showMarker({
    @required Coords coords,
    @required String title,
    String description,
    int zoom,
  }) {
    return MapLauncher.showMarker(
      mapType: mapType,
      coords: coords,
      title: title,
      description: description,
      zoom: zoom,
    );
  }

  Future<void> showDirections({
    @required Coords destination,
    String destinationTitle,
    Coords origin,
    String originTitle,
    List<Coords> waypoints,
    DirectionsMode directionsMode,
  }) {
    return MapLauncher.showDirections(
      mapType: mapType,
      destination: destination,
      destinationTitle: destinationTitle,
      origin: origin,
      originTitle: originTitle,
      waypoints: waypoints,
      directionsMode: directionsMode,
    );
  }

  @override
  String toString() {
    return 'AvailableMap { mapName: $mapName, mapType: ${Utils.enumToString(mapType)} }';
  }
}
