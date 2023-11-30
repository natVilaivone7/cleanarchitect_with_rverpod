import 'package:dartz/dartz.dart';
import 'package:paymentfronted/features/trip_app/domain/entities/trip_entities.dart';
import '../../../../core/error/failture.dart';

// Here will be the local data and Domain/repositort will be implement it
abstract class TripRepository {
  Future<Either<Failure, List<Trip>>> getTrip();
  Future<void> addTrip(Trip trip);
  Future<void> deleteTrip(int index);
}


