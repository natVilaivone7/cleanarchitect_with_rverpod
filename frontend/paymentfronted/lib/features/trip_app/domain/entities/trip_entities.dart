// in other folder or class that you want to inherite it you hace to ue the LIST<TRIP> ......!
class Trip {
  final String titles;
  final List<String> photos;
  final String description;
  final DateTime date;
  final String location;
  Trip(
      {required this.titles,
      required this.photos,
      required this.description,
      required this.date,
      required this.location});
}


