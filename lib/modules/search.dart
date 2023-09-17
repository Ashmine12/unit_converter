import 'unit_converting_formulas.dart';
import 'dropdown_contents.dart';

class SearchValues {
  String? id;
  String images;
  String title;
  List<String> list;
  Map<String, int> measuermap;
  dynamic formula;

  SearchValues({this.id,required this.title,required this.images,required this.list,required this.measuermap,  required this.formula});

}
List<SearchValues> searchItems = [
  SearchValues( images: 'images/v1.svg', title: 'Length', list: length,measuermap:lengthMap,formula: length_formulas),
  SearchValues( images: 'images/v2.svg', title: 'Area',list: area,measuermap:areaMap,formula: area_formulas),
  SearchValues( images: 'images/v3.svg', title: 'Volume',list: volume,measuermap:volumeMap,formula:volume_formulas ),
  SearchValues( images: 'images/v4.svg', title: 'Mass',list:mass,measuermap:massMap,formula: mass_formulas),
  SearchValues( images: 'images/v5.svg', title: 'Time',list: time,measuermap:timeMap,formula: time_formulas),
  SearchValues( images: 'images/v6.svg', title: 'Speed',list: speed,measuermap:speedMap,formula:speed_formulas ),
  SearchValues( images: 'images/v7.svg', title: 'Temperature',list: temperature,measuermap:temperatureMap,formula:temperature_formulas ),
  SearchValues( images: 'images/v8.svg', title: 'Density',list: density,measuermap:densityMap,formula: density_formulas),
  SearchValues( images: 'images/v9.svg', title: 'Energy',list: energy,measuermap:energyMap,formula:energy_formulas ),
  SearchValues( images: 'images/v10.svg', title: 'Angle',list: angle,measuermap:angleMap,formula: angle_formulas),
  SearchValues( images: 'images/v11.svg', title: 'Weight',list: weight,measuermap:weightMap,formula: weight_formulas),
  SearchValues( images: 'images/v12.svg', title: 'Fuel',list: fuel,measuermap:fuelMap,formula:fuel_formulas),

];
