import 'package:hive/hive.dart';
import 'package:paymentfronted/features/trip_app/data/model/trip_model.dart';

class TripLocalDatasources {
  final Box<TripModel> tripbox; //
  TripLocalDatasources({required this.tripbox});

  List<TripModel> getTrips() {
    return tripbox.values.toList();
  }
  void addTrips(TripModel tripModel) {
    tripbox.add(tripModel);
  }
  void deleteTrips(int index) {
    tripbox.deleteAt(index);
  }
}
