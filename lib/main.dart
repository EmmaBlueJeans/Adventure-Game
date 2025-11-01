import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
  title: 'Choose Your Adventure Game',
  home: AdventureGame(),
));

class AdventureGame extends StatefulWidget {
  @override
  _AdventureGameState createState() => _AdventureGameState();
}

class _AdventureGameState extends State<AdventureGame> {
  int _currentRoom = 1;



  void _moveTo(int nextRoom) {
    setState(() {
      _currentRoom = nextRoom;
    });
  }

  @override
  Widget build(BuildContext context) {
    String roomText = '';
    List<Widget> buttons = [];

      final ButtonStyle directionButtonStyle = ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo[400],
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )
      );

    // Decide what text & buttons to show for each room
    if (_currentRoom == 0) {
      roomText = 'You are outside the castle.  Go East to re-enter.';
      buttons = [
        ElevatedButton(
          style: directionButtonStyle,
          onPressed: () => _moveTo(1),
          child: const Text('East'),
        ),
      ];
    } else if (_currentRoom == 1) {
      roomText = 'Entrance Hall: tapestries and a big wooden door.';
      buttons = [
        ElevatedButton(style: directionButtonStyle, onPressed: () => _moveTo(0), child: const Text('West')),
        ElevatedButton(style: directionButtonStyle, onPressed: () => _moveTo(2), child: const Text('East')),
        ElevatedButton(style: directionButtonStyle, onPressed: () => _moveTo(6), child: const Text('South')),
      ];
    } else if (_currentRoom == 2) {
      roomText = 'Banquet Hall: long table, half-eaten feast.';
      buttons = [
        ElevatedButton(style: directionButtonStyle, onPressed: () => _moveTo(1), child: const Text('West')),
        ElevatedButton(style: directionButtonStyle, onPressed: () => _moveTo(3), child: const Text('East')),
        ElevatedButton(style: directionButtonStyle, onPressed: () => _moveTo(5), child: const Text('South')),
      ];
    } else if (_currentRoom == 3) {
      roomText = 'Kitchen: hot stoves and hanging pots.';
      buttons = [
        ElevatedButton(style: directionButtonStyle, onPressed: () => _moveTo(2), child: const Text('West')),
        ElevatedButton(style: directionButtonStyle, onPressed: () => _moveTo(4), child: const Text('South')),
      ];
    } else if (_currentRoom == 4) {
      roomText = 'Library: shelves to the ceiling.';
      buttons = [
        ElevatedButton(style: directionButtonStyle, onPressed: () => _moveTo(3), child: const Text('North')),
        ElevatedButton(style: directionButtonStyle, onPressed: () => _moveTo(5), child: const Text('West')),
      ];
    } else if (_currentRoom == 5) {
      roomText = 'Armory: weapons on the walls.';
      buttons = [
        ElevatedButton(style: directionButtonStyle, onPressed: () => _moveTo(6), child: const Text('West')),
        ElevatedButton(style: directionButtonStyle, onPressed: () => _moveTo(2), child: const Text('North')),
        ElevatedButton(style: directionButtonStyle, onPressed: () => _moveTo(4), child: const Text('East')),
      ];
    } else if (_currentRoom == 6) {
      roomText = 'Dungeon: cold, damp, and dark.';
      buttons = [
        ElevatedButton(style: directionButtonStyle, onPressed: () => _moveTo(5), child: const Text('East')),
        ElevatedButton(style: directionButtonStyle, onPressed: () => _moveTo(1), child: const Text('North')),
        ElevatedButton(style: directionButtonStyle, onPressed: () => _moveTo(0), child: const Text('West')),
      ];
    }
    // build the page
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: const Text('Choose Your Adventure Game'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              roomText,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...buttons,
          ],
        ),
      ),

    //exit button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.indigo[500],
            side: BorderSide(color: Colors.indigo.shade300, width: 1.5),
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
              ),
                onPressed: () {
                  SystemNavigator.pop();  //closes the app
                },
                child: const Text('Exit Game',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
           ),
    );

  }
}
