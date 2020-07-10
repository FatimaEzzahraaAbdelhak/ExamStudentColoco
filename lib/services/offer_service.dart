import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_login_demo/services/offer.dart';

class offerService {

  final firestoreInstance = Firestore.instance;

  getoffers() {
    return firestoreInstance.collection("cars").getDocuments();
  }

  createoffer(Offer offer) {
    print(offer.toJson());
    firestoreInstance.collection("cars").add(offer.toJson()).then((value) => print(value));
  }
}
