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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildAnimalsFirstRow(),
              _buildAnimalsSecondRow(),
              _buildAnimalsThirdRow(),
              _buildAnimalsFourthRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimalsFirstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildAnimal('bear.jpeg', 'bear.wav'),
        _buildAnimal('birds.jpg', 'birds.wav'),
        _buildAnimal('cat.jpeg', 'cat.wav'),
      ],
    );
  }

  Widget _buildAnimalsSecondRow() {
    return Row(
      children: <Widget>[
        _buildAnimal('chicken.jpeg', 'chicken.wav'),
        _buildAnimal('lion.jpeg', 'lion.wav'),
        _buildAnimal('cow.jpg', 'cow.wav'),
      ],
    );
  }

  Widget _buildAnimalsThirdRow() {
    return Row(
      children: <Widget>[
        _buildAnimal('dog.jpg', 'dog.wav'),
        _buildAnimal('dolphin.jpg', 'dolphin.wav'),
        _buildAnimal('donkey.jpeg', 'donkey.wav'),
      ],
    );
  }

  Widget _buildAnimalsFourthRow() {
    return Row(
      children: <Widget>[
        _buildAnimal('hawk.jpeg', 'hawk.wav'),
        _buildAnimal('horse.jpg', 'horse.wav'),
        _buildAnimal('rooster.jpeg', 'rooster.wav'),
      ],
    );
  }

  Widget _buildAnimal(String imageName, String soundName) {
    return Expanded(
      flex: 8,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: GestureDetector(
          onTap: () => _playAnimalSound(soundName),
          child: CircleAvatar(
            maxRadius: 70.0,
            backgroundImage: AssetImage('assets/images/$imageName'),
          ),
        ),
      ),
    );
  }

  void _playAnimalSound(String soundName) {
    player.play(soundName);
  }
}
