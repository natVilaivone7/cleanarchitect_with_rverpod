import 'package:paymentfronted/features/trip_app/domain/repositorise/trip_repository.dart';

class DeleteTrip {
  final TripRepository deletetripRepository;

  DeleteTrip({required this.deletetripRepository});

  Future<void> call(int index) {
    return deletetripRepository.deleteTrip(index);
  }
}
