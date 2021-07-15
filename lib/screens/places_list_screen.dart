import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './add_place_screen.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Center(
        child: Consumer<GreatPlaces>(
          child: Center(
            child: Text('Got no places yet'),
          ),
          builder: (context, greatPlaces, ch) => greatPlaces.items.length <= 0
              ? ch as Widget
              : ListView.builder(
                  itemCount: greatPlaces.items.length,
                  itemBuilder: (ctx, i) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: FileImage(greatPlaces.items[i].image),
                      ),
                      title: Text(greatPlaces.items[i].title),
                      onTap: () {
                        // go to detail page
                      }),
                ),
        ),
      ),
    );
  }
}