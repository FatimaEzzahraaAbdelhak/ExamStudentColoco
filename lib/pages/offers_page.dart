import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_demo/pages/offer_form_page.dart';
import 'package:flutter_login_demo/pages/offer_widget.dart';
import 'package:flutter_login_demo/services/authentication.dart';
import 'package:flutter_login_demo/services/offer.dart';
import 'package:flutter_login_demo/services/offer_service.dart';

class offersPage extends StatefulWidget {

  offersPage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _offersPageState();
}

class _offersPageState extends State<offersPage> {

  offerService _offerService = offerService();
  List<Offer> _offers = [];

  @override
  void initState() {
    loadoffers();
    super.initState();
  }

  loadoffers() {
    this._offerService.getoffers().then((querySnapshot) {
      List<Offer> offers = [];
      querySnapshot.documents.forEach((response) {
        print(response.data);
        offers.add(Offer.fromSnapshot(response));
      });

      setState(() {
        this._offers = offers;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('COLOCO APPLICATION'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => offerFormPage()),
                );
              },
              child: Icon(
                Icons.add,
                size: 26.0,
              ),
            )
          ),
        ]
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 13),
        child: ListView.builder(
          itemCount: _offers.length,
          itemBuilder: (BuildContext context, int position) {
            return offerWidget(_offers[position]);
          }
         ),
      ),
    );
  }
}
