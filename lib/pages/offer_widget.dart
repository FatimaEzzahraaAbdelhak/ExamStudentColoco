import 'package:flutter/material.dart';
import 'package:flutter_login_demo/pages/offer_details_page.dart';
import 'package:flutter_login_demo/services/offer.dart';

class offerWidget extends StatelessWidget {

  Offer _offer;
  offerWidget([this._offer]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => offerDetailsPage(_offer)),
        )
      },
      child: new Container(
        height: 160,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: Image(
                  width: 160,
                  height: double.infinity,
                  image: NetworkImage(
                      _offer.images[0]
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _offer.title.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  height: 1.3,
                                  color: Colors.lightGreen
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Divider(
                            ),
                            Text(
                              _offer.adress.substring(0, (_offer.adress.length > 60 ? 60 : _offer.adress.length)) + '...',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  height: 1.2,
                                  color: Colors.grey
                              )
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                _offer.price + " " + _offer.currency + " / Mois",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    height: 1.2,
                                    color: Colors.red
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
