import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dad\'s Farm',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioCache player = AudioCache(prefix: 'sounds/');

  @override
  void initState() {
    player.loadAll(['bear.wav']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          maxRadius: 25.0,
          backgroundImage: AssetImage('assets/images/farm.jpg'),
        ),
        title: Center(
          child: Text('Dad\'s Farm'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 16.0),
              _buildAnimalsFirstRow(),
              SizedBox(height: 8.0),
              _buildAnimalsSecondRow(),
              SizedBox(height: 8.0),
              _buildAnimalsThirdRow(),
              SizedBox(height: 8.0),
              _buildAnimalsFourthRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimalsFirstRow() {
    return Row(
      children: <Widget>[
        _buildAnimal('bear.jpeg', 'bear.wav'),
        _buildSpacer(),
        _buildAnimal('birds.jpg', 'birds.wav'),
        _buildSpacer(),
        _buildAnimal('cat.jpeg', 'cat.wav'),
      ],
    );
  }

  Widget _buildAnimalsSecondRow() {
    return Row(
      children: <Widget>[
        _buildAnimal('chicken.jpeg', 'chicken.wav'),
        _buildSpacer(),
        _buildAnimal('lion.jpeg', 'lion.wav'),
        _buildSpacer(),
        _buildAnimal('cow.jpg', 'cow.wav'),
      ],
    );
  }

  Widget _buildAnimalsThirdRow() {
    return Row(
      children: <Widget>[
        _buildAnimal('dog.jpg', 'dog.wav'),
        _buildSpacer(),
        _buildAnimal('dolphin.jpg', 'dolphin.wav'),
        _buildSpacer(),
        _buildAnimal('donkey.jpeg', 'donkey.wav'),
      ],
    );
  }

  Widget _buildAnimalsFourthRow() {
    return Row(
      children: <Widget>[
        _buildAnimal('hawk.jpeg', 'hawk.wav'),
        _buildSpacer(),
        _buildAnimal('horse.jpg', 'horse.wav'),
        _buildSpacer(),
        _buildAnimal('rooster.jpeg', 'rooster.wav'),
      ],
    );
  }

  Widget _buildAnimal(String imageName, String soundName) {
    return Expanded(
      flex: 8,
      child: GestureDetector(
        onTap: () => _playAnimalSound(soundName),
        child: CircleAvatar(
          maxRadius: 70.0,
          backgroundImage: AssetImage('assets/images/$imageName'),
        ),
      ),
    );
  }

  Widget _buildSpacer() {
    return Expanded(
      flex: 1,
      child: Container(),
    );
  }

  void _playAnimalSound(String soundName) {
    player.play(soundName);
  }
}
