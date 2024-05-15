import 'package:flutter/material.dart';
import 'package:login/Screen/sanctuarydetails.dart';
import 'dart:math' as math;
import 'package:login/model/sanctuary_model.dart';

class SanctuaryScreen extends StatefulWidget {
  const SanctuaryScreen({super.key});

  @override
  State<SanctuaryScreen> createState() => _SanctuaryScreenState();
}

class _SanctuaryScreenState extends State<SanctuaryScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int tabLength = 4;
  @override
  void initState() {
    tabController = TabController(
      length: tabLength,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(
            20, mediaQuery.padding.top, 20, mediaQuery.padding.bottom),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 61, 138, 225),
              Color.fromARGB(255, 115, 142, 171),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            ),
            const SizedBox(height: 20),
            const Text(
              "Top Bird Sanctuaries in Kerala",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
            const Text(
              "Protect our earth together.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  height: 1.5,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 20),
           
            Expanded(
                child: TabBarView(
              controller: tabController,
              children: [
                buildAnimalList(sanctuaryData),
                
              ],
            )),
            
          ],
        ),
      ),
    );
  }

  ListView buildAnimalList(List<SanctuaryModel> sanctuaryList) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 15),
        itemCount: sanctuaryList.length,
        itemBuilder: (context, index) {
          return SanctuaryCard(
            sanctuary: sanctuaryList[index],
          );
        });
  }
}


class SanctuaryCard extends StatelessWidget {
  const SanctuaryCard({Key? key, required this.sanctuary}) : super(key: key);

  final SanctuaryModel sanctuary;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SanctuaryDetailsScreen(sanctuary: sanctuary),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sanctuary.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.white54),
                const SizedBox(width: 5),
                Text(
                  sanctuary.location,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




