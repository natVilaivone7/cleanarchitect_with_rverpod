import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paymentfronted/features/trip_app/domain/entities/trip_entities.dart';
import 'package:paymentfronted/features/trip_app/pressentation/riverpod/tirp_riverpod.dart';

class AddTripScreen extends ConsumerWidget {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final TextEditingController titleController =
      TextEditingController(text: "itme");
  final TextEditingController descriptionController =
      TextEditingController(text: "in my home");
  final TextEditingController locationController =
      TextEditingController(text: "laos");
  final TextEditingController picturesController = TextEditingController(
      text:
          "https://thumbs.dreamstime.com/b/green-natural-environment-14335871.jpg?w=768");
  List<String> pictures = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: "description"),
              ),
              TextFormField(
                controller: locationController,
                decoration: const InputDecoration(labelText: "location"),
              ),
              TextFormField(
                controller: picturesController,
                decoration: const InputDecoration(labelText: "photos"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.blue,
                      minimumSize: Size(100, 50)),
                  onPressed: () {
                    pictures.add(picturesController.text);
                    if (_formkey.currentState!.validate()) {
                      final newTrip = Trip(
                          titles: titleController.text,
                          photos: pictures,
                          description: descriptionController.text,
                          date: DateTime.now(),
                          location: locationController.text);
                      ref
                          .read(tripListNotifierProvider.notifier)
                          .addNewTrip(newTrip);
                       ref.read(tripListNotifierProvider.notifier).loadTrips();
                    }
                  },
                  child: const Text(
                    "Add pictur",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ));
  }
}
