import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'resp_model.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  Future<Respmodel> fetchData() async {
    String urlInput =
        'https://firebasestorage.googleapis.com/v0/b/jill-soap-6a1ac.appspot.com/o/maps.json?alt=media&token=bfd28b0f-06d7-4d25-8d45-e218466c7449';
    final response = await http.get(Uri.parse(urlInput));

    if (response.statusCode == 200) {
      return Respmodel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Integration'),
      ),
      body: Center(
        child: FutureBuilder<Respmodel>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final bounds = snapshot.data?.routes![0].bounds;
              final legs = snapshot.data?.routes![0].legs;

              final routesList = snapshot.data!;
              return SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bounds',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Northeast: (${bounds!.northeast!.lat}, ${bounds.northeast!.lng})'),
                          Text(
                              'Southwest: (${bounds.southwest!.lat}, ${bounds.southwest!.lng})'),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Text(
                        'Legs',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      _buildLegsDetails(legs![0]),
                      Divider(
                        thickness: 1,
                      ),
                      Text(
                        'Steps',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: _buildStepsList(legs[0].steps),
                      )),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLegsDetails(Legs leg) {
    return Container(
      padding: EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Start Address: ${leg.startAddress ?? ""}'),
          Text('End Address: ${leg.endAddress ?? ""}'),
          Text('Distance: ${leg.distance!.text ?? ""}'),
          Text('Duration: ${leg.duration!.text ?? ""}'),
          Text('Start Location:'),
          Text(
              'latitude ${leg.startLocation!.lat} longitude ${leg.startLocation!.lng}'),
          Text('End Location:'),
          Text(
              'latitude ${leg.endLocation!.lat} longitude ${leg.endLocation!.lng}'),
        ],
      ),
    );
  }

  Widget _buildStepsList(List<Steps>? stepsList) {
    return ListView.separated(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: stepsList!.length,
      separatorBuilder: (context, index) {
        return Divider(
          thickness: 1,
          color: Colors.grey,
        );
      },
      itemBuilder: (context, index) {
        final step = stepsList[index];
        return Padding(
          padding: EdgeInsets.only(left: 8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Html instructions: ' + step.htmlInstructions!),
            Text('Travel Mod: ' + step.travelMode!),
            Text('Distance: ${step.distance!.text!}'),
            Text('Duration: ${step.duration!.text!}'),
            Text('Start Location:'),
            Text(
                'latitude ${step.startLocation!.lat} longitude ${step.startLocation!.lng}'),
            Text('End Location:'),
            Text(
                'latitude ${step.endLocation!.lat} longitude ${step.endLocation!.lng}'),
          ]),
        );
      },
    );
  }

  @override
  void dispose() {
    // Close the client when the screen is disposed to avoid memory leaks
    http.Client().close();
    super.dispose();
  }
}
