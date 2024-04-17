import 'package:flutter/material.dart';
import 'package:login/Screen/audio.dart';
import 'package:login/Screen/birdimage.dart';
import 'package:login/Screen/discover.dart';
import 'package:login/Screen/profile.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({Key? key}) : super(key: key);

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int currentIndex = 0;

 
  final List<Map<String, dynamic>> pages = [
    {'page': DiscoverScreen(), }, 
    {'page': birdPage(), }, 
    {'page': AudioRecorder(), },
    {'page':  ProfileScreen(),},
  ];



  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: pages[currentIndex]['page'], // Use the page widget based on currentIndex
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 3, 68, 122),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Image'),
          BottomNavigationBarItem(icon: Icon(Icons.mic), label: 'Audio'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

























