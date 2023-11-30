import 'package:dartz/dartz.dart';
import 'package:paymentfronted/features/trip_app/domain/entities/trip_entities.dart';
import 'package:paymentfronted/features/trip_app/domain/repositorise/trip_repository.dart';

import '../../../../core/error/failture.dart';

class getTrip {
  final TripRepository gettripRepository;
  getTrip(this.gettripRepository);
  Future<Either<Failure, List<Trip>>> call(){
    return  gettripRepository.getTrip();
  }
}
