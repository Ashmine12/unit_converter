
import 'package:unit_converter_app/constants/assets.dart';
import 'package:unit_converter_app/modules/dropdown_contents.dart';
import 'package:unit_converter_app/modules/unit_converting_formulas.dart';

class HomeScreenContents {
  String images;
  String title;
  List<String> list;
  Map<String, int> measureMap;
  dynamic formula;

  HomeScreenContents({
    required this.title,
    required this.images,
    required this.list,
    required this.measureMap,
    required this.formula,
  });
}

List<HomeScreenContents> homeContents = [
  HomeScreenContents(
    images: Assets.length,
    title: 'Length',
    list: length,
    measureMap: lengthMap,
    formula: length_formulas,
  ),
  HomeScreenContents(
    images: Assets.area,
    title: 'Area',
    list: area,
    measureMap: areaMap,
    formula: area_formulas,
  ),
  HomeScreenContents(
    images: Assets.volume,
    title: 'Volume',
    list: volume,
    measureMap: volumeMap,
    formula: volume_formulas,
  ),
  HomeScreenContents(
    images: Assets.mass,
    title: 'Mass',
    list: mass,
    measureMap: massMap,
    formula: mass_formulas,
  ),
  HomeScreenContents(
    images: Assets.time,
    title: 'Time',
    list: time,
    measureMap: timeMap,
    formula: time_formulas,
  ),
  HomeScreenContents(
    images: Assets.speed,
    title: 'Speed',
    list: speed,
    measureMap: speedMap,
    formula: speed_formulas,
  ),
  HomeScreenContents(
    images: Assets.temperature,
    title: 'Temperature',
    list: temperature,
    measureMap: temperatureMap,
    formula: temperature_formulas,
  ),
  HomeScreenContents(
    images: Assets.density,
    title: 'Density',
    list: density,
    measureMap: densityMap,
    formula: density_formulas,
  ),
  HomeScreenContents(
    images: Assets.energy,
    title: 'Energy',
    list: energy,
    measureMap: energyMap,
    formula: energy_formulas,
  ),
  HomeScreenContents(
    images: Assets.angle,
    title: 'Angle',
    list: angle,
    measureMap: angleMap,
    formula: angle_formulas,
  ),
  HomeScreenContents(
    images: Assets.weight,
    title: 'Weight',
    list: weight,
    measureMap: weightMap,
    formula: weight_formulas,
  ),
  HomeScreenContents(
    images: Assets.fuel,
    title: 'Fuel',
    list: fuel,
    measureMap: fuelMap,
    formula: fuel_formulas,
  ),
];
