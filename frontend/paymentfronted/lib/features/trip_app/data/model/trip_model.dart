import 'package:hive/hive.dart';
import 'package:paymentfronted/features/trip_app/domain/entities/trip_entities.dart';
part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel  { 
  @HiveField(0)
  final String titles; 
  @HiveField(1)
  final List<String> photos;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final String location;

  TripModel(
      {required this.titles,
      required this.photos,
      required this.description,
      required this.date,
      required this.location});
// conversion from entitise to model ;
  factory TripModel.fromEntity(Trip trip) => TripModel(
      titles: trip.titles,
      photos: trip.photos,
      description: trip.description,
      date: trip.date,
      location: trip.location);

// conversion from model to entitise ;

  Trip toEntity() => Trip(
      titles: titles,
      photos: photos,
      description: description,
      date: date,
      location: location);


}

