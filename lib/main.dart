import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return ListView(
            children: [
              orientation == Orientation.portrait
                  ? _buildPortraitLayout()
                  : _buildLandscapeLayout(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: CircleAvatar(
            radius: 200.0,
            backgroundImage: NetworkImage('https://images.pexels.com/photos/3454835/pexels-photo-3454835.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
          ),
        ),
        const Text(
          'Yasin Mia ',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'The "RenderFlex overflowed" error occurs when the content within a Column exceeds the available vertical space. ',
          style: TextStyle(
            fontSize: 16.0,

          ),
        ),
        SizedBox(height: 16.0),
        _buildImageGrid(2),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: CircleAvatar(
            radius: 130.0,
            backgroundImage: NetworkImage('https://images.pexels.com/photos/3454835/pexels-photo-3454835.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yasin Mia',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'The "RenderFlex overflowed" error occurs when the content within a Column exceeds the available vertical space. ',
                style: TextStyle(
                  fontSize: 16.0,

                ),
              ),
              SizedBox(height: 16.0),
              _buildImageGrid(3),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImageGrid(int columnCount) {
    return SizedBox(
      height: 250,
      width: 300,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          crossAxisCount: 3,
        ),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          final imageUrl = 'https://images.pexels.com/photos/1975069/pexels-photo-1975069.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1$index';
          return Image.network(imageUrl);
        },
      ),
    );
  }
}
