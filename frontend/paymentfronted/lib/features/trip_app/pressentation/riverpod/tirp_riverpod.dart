import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:paymentfronted/features/trip_app/data/datasources/trip_local_datacourses.dart';
import 'package:paymentfronted/features/trip_app/data/repositorise/trip_repisitory_impl.dart';
import '../../data/model/trip_model.dart';
import '../../domain/entities/trip_entities.dart';
import '../../domain/repositorise/trip_repository.dart';
import '../../domain/usecases/add_trip_usecase.dart';
import '../../domain/usecases/delete_trip_usecase.dart';
import '../../domain/usecases/get_trip_usecase.dart';

final tripLocalDataSourceProvider = Provider<TripLocalDatasources>((ref) {
  final Box<TripModel> tripBox = Hive.box('trips');
  return TripLocalDatasources(tripbox: tripBox);
});

final tripRepositoryProvider = Provider<TripRepository>((ref) {
  final localDataSource = ref.read(tripLocalDataSourceProvider);
  return TripRepositoyImpl(localDataSource);
});

//##########################################################//
/* this will be from the USERCASES METHOD ONLY from DOMAIN LAYER */
// AddTrip
final addTripProvider = Provider<AddTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return AddTrip(tripRepository: repository);
});

// GetTrip
final getTripsProvider = Provider<getTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return getTrip(repository);
});
// DeleteTrip
final deleteTripProvider = Provider<DeleteTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return DeleteTrip(deletetripRepository: repository);
});
// #########################################################//
// This provider will manage fetching trips from the repository.
final tripListNotifierProvider =
    StateNotifierProvider<TripListNotifier, List<Trip>>((ref) {
  final getTrips = ref.read(getTripsProvider);
  final addTrip = ref.read(addTripProvider);
  final deleteTrip = ref.read(deleteTripProvider);

  return TripListNotifier(getTrips, addTrip, deleteTrip);
});

class TripListNotifier extends StateNotifier<List<Trip>> {
  final getTrip _getTrips;
  final AddTrip _addTrip;
  final DeleteTrip _deleteTrip;

  TripListNotifier(this._getTrips, this._addTrip, this._deleteTrip) : super([]);

  Future<void> addNewTrip(Trip trip) async {
    await _addTrip(trip);
    //state = [...state, trip];
  }

  Future<void> removeTrip(int tripId) async {
    await _deleteTrip(tripId);
  }

  // Load trips from the repository and update the state.
  Future<void> loadTrips() async {
    final tripsOrFailure = await _getTrips();
    tripsOrFailure.fold((error) => state = [], (trips) => state = trips);
  }
}
