import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_demo/services/offer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class offerDetailsPage extends StatelessWidget {

  Offer _offer;

  offerDetailsPage(this._offer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Details'),
      ),
      body: SingleChildScrollView(
        // color: Colors.white,
        child: SizedBox(
            height: 2000,
            child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: Colors.black12),
              child: Image(
                width: 160,
                height: 290,
                image: NetworkImage(_offer.images[0]),
                fit: BoxFit.cover,
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 8),
                              child: Text(
                                _offer.title.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 8),
                              child: Text(
                                (_offer.price + ' ' + _offer.currency + '/ Mois').toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    height: 1.3,
                                    color: Colors.red),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                _offer.attributes.join(', '),
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                _offer.adress,
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Divider(),
                            SizedBox(
                              height: 400,
                              child: GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(double.parse(_offer.long), double.parse(_offer.lat)),
                                  zoom: 17.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

