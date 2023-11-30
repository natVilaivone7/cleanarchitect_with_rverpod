import 'package:dartz/dartz.dart';
import 'package:paymentfronted/core/error/failture.dart';
import 'package:paymentfronted/features/trip_app/data/datasources/trip_local_datacourses.dart';
import 'package:paymentfronted/features/trip_app/data/model/trip_model.dart';
import 'package:paymentfronted/features/trip_app/domain/entities/trip_entities.dart';
import 'package:paymentfronted/features/trip_app/domain/repositorise/trip_repository.dart';

class TripRepositoyImpl implements TripRepository {
  final TripLocalDatasources localDatasources;

  TripRepositoyImpl(this.localDatasources);
  @override
  Future<void> addTrip(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);
    localDatasources.addTrips(tripModel);
  }

  @override
  Future<void> deleteTrip(int index) async {
    final deletetrip = localDatasources.deleteTrips(index);
    return deletetrip;
  }

  @override
  Future<Either<Failure, List<Trip>>> getTrip() async {
    try {
      final getripmodel = localDatasources.getTrips();
      List<Trip> res = getripmodel.map((e) => e.toEntity()).toList();
      return Right(res);
    } catch (eroor) {
      return Left(SomespecificError(eroor.toString()));
    }
  }
}
