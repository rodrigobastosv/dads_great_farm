import 'package:audioplayers/audio_cache.dart';
import 'package:dads_great_farm/animal.dart';
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

  List<Animal> animals = [
    Animal(image: 'bear.jpeg', audio: 'bear.wav'),
    Animal(image: 'birds.jpg', audio: 'birds.wav'),
    Animal(image: 'cat.jpeg', audio: 'cat.wav'),
    Animal(image: 'chicken.jpeg', audio: 'chicken.wav'),
    Animal(image: 'lion.jpeg', audio: 'lion.wav'),
    Animal(image: 'cow.jpg', audio: 'cow.wav'),
    Animal(image: 'dog.jpg', audio: 'dog.wav'),
    Animal(image: 'dolphin.jpg', audio: 'dolphin.wav'),
    Animal(image: 'donkey.jpeg', audio: 'donkey.wav'),
    Animal(image: 'hawk.jpeg', audio: 'hawk.wav'),
    Animal(image: 'horse.jpg', audio: 'horse.wav'),
    Animal(image: 'rooster.jpeg', audio: 'rooster.wav')
  ];

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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: GridView.builder(
            itemCount: animals.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 12.0),
            itemBuilder: (BuildContext context, int index) {
              return _buildAnimal(animals[index]);
            },
          ),
        ));
  }

  Widget _buildAnimal(Animal animal) {
    return Container(
      height: 80.0,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: GestureDetector(
          onTap: () => _playAnimalSound(animal.audio),
          child: CircleAvatar(
            maxRadius: 70.0,
            backgroundImage: AssetImage('assets/images/${animal.image}'),
          ),
        ),
      ),
    );
  }

  void _playAnimalSound(String soundName) {
    player.play(soundName);
  }
}
