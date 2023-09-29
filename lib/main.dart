import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageFeed(),
    );
  }
}

class ImageFeed extends StatelessWidget {
  final List<String> dummyImages = [
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
  ];

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
      ),
      body: orientation == Orientation.portrait
          ? buildListView()
          : buildGridView(),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: dummyImages.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 150,
          width: 150,
          child: Card(

            margin: const EdgeInsets.all(8.0),
            child: Image.network(

                dummyImages[index]),
          ),
        );
      },
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Adjust this based on your requirements
      ),
      itemCount: dummyImages.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: Image.network(dummyImages[index]),
        );
      },
    );
  }
}
