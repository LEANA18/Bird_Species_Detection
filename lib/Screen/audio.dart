import 'package:flutter/material.dart';


class AudioRecorder extends StatefulWidget {
  @override
  _AudioRecorderState createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
 
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Recorder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
                 Text('Press button to start recording'),
            SizedBox(height: 50),
            IconButton(
             icon: Icon(Icons.mic),
              iconSize: 50.0,
              onPressed: () {
               
              },
            ),
          
          ],
        ),
      ),
    );
  }
}























