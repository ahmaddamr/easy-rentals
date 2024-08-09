import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_rentals/data/models/car_model.dart';

class FirebaseData {
  final FirebaseFirestore firestore;

  FirebaseData({required this.firestore});
  Future<List<CarModel>> getCars() async {
    var snapshot = await firestore.collection('cars').get();
    return snapshot.docs.map((doc) => CarModel.fromMap(doc.data())).toList();
  }
}
