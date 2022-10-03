import 'package:animated_cards/animated_cards_widgets/hotel_list.dart';
import 'package:animated_cards/animated_cards_widgets/styles.dart';
import 'package:animated_cards/animated_cards_widgets/travel_card_list.dart';
import 'package:flutter/material.dart';

import 'demo_data.dart';
// import '../hotel_list.dart';
// import '../styles.dart';
// import '../travel_card_list.dart';

class TravelCardDemo extends StatefulWidget {
  @override
  _TravelCardDemoState createState() => _TravelCardDemoState();
}

class _TravelCardDemoState extends State<TravelCardDemo> {
  List<City> _cityList = [];
  late City _currentCity;

  @override
  void initState() {
    super.initState();
    var data = DemoData();
    _cityList = data.getCities();
    _currentCity = _cityList[1];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: Icon(Icons.menu, color: Colors.black),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Styles.hzScreenPadding),
            child: Icon(Icons.search, color: Colors.black),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Styles.hzScreenPadding),
              child: Text(
                'Where are you going next?',
                overflow: TextOverflow.ellipsis,
                style: Styles.appHeader,
                maxLines: 2,
              ),
            ),
            TravelCardList(
              cities: _cityList,
              onCityChange: _handleCityChange,
            ),
            HotelList(_currentCity.hotels),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }

  void _handleCityChange(City city) {
    setState(() {
      this._currentCity = city;
    });
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      leading: Icon(Icons.menu, color: Colors.black),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      actions: <Widget>[
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: Styles.hzScreenPadding),
          child: Icon(Icons.search, color: Colors.black),
        )
      ],
    );
  }
}
