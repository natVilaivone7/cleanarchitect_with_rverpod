 import 'package:paymentfronted/features/trip_app/domain/entities/trip_entities.dart';
import 'package:paymentfronted/features/trip_app/domain/repositorise/trip_repository.dart';

class AddTrip {
  final TripRepository tripRepository;
  AddTrip({required this.tripRepository});

  Future<void> call(Trip trip) {
    return  tripRepository.addTrip(trip);
  }
}
