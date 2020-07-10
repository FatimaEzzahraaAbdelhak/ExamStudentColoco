import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class Offer {
  String key;
  String title;
  String adress;
  String phoneNumber;
  String price;
  String currency;
  String long;
  String lat;
  List<dynamic> images;
  List<dynamic> attributes;
  String userId;

  Offer(this.title, this.adress, this.price, this.currency,
    this.long, this.lat, this.attributes, this.images);

  Offer.fromSnapshot(snapshot) :
      title = snapshot.data["title"],
      adress = snapshot.data["adress"],
      phoneNumber = snapshot.data["phoneNumber"],
      price = snapshot.data["price"].toString(),
      currency = snapshot.data["currency"],
      long = snapshot.data["long"],
      lat = snapshot.data["lat"],
      images = snapshot.data["images"],
      attributes = snapshot.data["attributes"],
      userId = snapshot.data["userId"];

  getAttributes() {
    return this.attributes.join(',');
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'adress': adress,
    'price': price,
    'currency': currency,
    'long': long,
    'lat': lat,
    'attributes': attributes,
    'phoneNumber': phoneNumber,
    'images': images,
  };
}
