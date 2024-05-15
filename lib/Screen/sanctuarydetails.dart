import 'package:flutter/material.dart';
import 'package:login/model/sanctuary_model.dart';

class SanctuaryDetailsScreen extends StatelessWidget {
  const SanctuaryDetailsScreen({Key? key, required this.sanctuary}) : super(key: key);

  final SanctuaryModel sanctuary;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        //title: Text(sanctuary.name),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 61, 138, 225),
                Color.fromARGB(255, 115, 142, 171),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 61, 138, 225),
              Color.fromARGB(255, 115, 142, 171),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            mediaQuery.padding.top + 20,
            20,
            mediaQuery.padding.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sanctuary.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  sanctuary.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 300),
                // Additional widgets here...
              ],
            ),
          ),
        ),
      ),
    );
  }
}



