import 'dart:html';

import 'package:complex/models/models.dart';
import 'package:complex/services/services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("COMPLEX API"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getPostApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    } else {
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                children: [
                                  ReusbaleRow(
                                    title: 'name',
                                    value: data[index]['name'].toString(),
                                  ),
                                  ReusbaleRow(
                                    title: 'Username',
                                    value: data[index]['username'].toString(),
                                  ),
                                  ReusbaleRow(
                                    title: 'address',
                                    value: data[index]['address']['street']
                                        .toString(),
                                  ),
                                  ReusbaleRow(
                                    title: 'Lat',
                                    value: data[index]['address']['geo']['lat']
                                        .toString(),
                                  ),
                                  ReusbaleRow(
                                    title: 'Lat',
                                    value: data[index]['address']['geo']['lng']
                                        .toString(),
                                  ),
                                ],
                              ),
                            );
                          });
                    }
                  }))
        ],
      ),
    ));
  }
}

//
class ReusbaleRow extends StatelessWidget {
  String title, value;
  ReusbaleRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
