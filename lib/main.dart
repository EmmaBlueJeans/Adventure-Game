import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'Choose Your Adventure Game',
  home: AdventureGame(),
));

class AdventureGame extends StatefulWidget {
  @override
  _AdventureGameState createState() => _AdventureGameState();
}

class _AdventureGameState extends State<AdventureGame> {
  int _currentStep = 1;

  void _selectOption(int option) {
    setState(() {
      _currentStep = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Adventure Game'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Step $_currentStep: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              _currentStep == 1
                  ? 'You find yourself standing in front of two doors. Which door do you choose?'
                  : _currentStep == 2
                  ? 'You enter the room and find a treasure chest. What do you want to do?'
                  : 'Game Over. You have reached the end of the adventure.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            _currentStep != 3
                ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    _selectOption(2 * _currentStep);
                  },
                  child: Text('Door ${2 * _currentStep}'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _selectOption(2 * _currentStep + 1);
                  },
                  child: Text('Door ${2 * _currentStep + 1}'),
                ),
              ],
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
