import 'package:flutter/material.dart';
import 'package:login/Screen/details.dart';
import 'dart:math' as math;
import 'package:login/model/bird_model.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
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
              "Discover",
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
                buildAnimalList(birdData),
                
              ],
            )),
            
          ],
        ),
      ),
    );
  }

  ListView buildAnimalList(List<BirdModel> birdList) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 15),
        itemCount: birdList.length,
        itemBuilder: (context, index) {
          return BirdCard(
            bird: birdList[index],
          );
        });
  }
}

class BirdCard extends StatelessWidget {
  const BirdCard({super.key, required this.bird});
  final BirdModel bird;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(bird: bird)));
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: mediaQuery.size.width * 0.55,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(5, 5)),
              ],
            ),
            child: Row(
              children: [
                MapArea(color: bird.bgColor, location: bird.location),
                const ButtonArea(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: Container(
              width: mediaQuery.size.width * 0.5,
              height: mediaQuery.size.width * 0.5,
              child: Hero(
                tag: bird.name,
                child: FittedBox(
                    fit: BoxFit.cover, child: Image.asset(bird.imageUrl)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MapArea extends StatelessWidget {
  const MapArea({
    Key? key,
    required this.color,
    required this.location,
  }) : super(key: key);

  final Color color;
  final String location;

  Alignment get _alignment {
    final random = math.Random();
    return Alignment(random.nextDouble(), random.nextDouble());
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          image: DecorationImage(
            alignment: _alignment,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.dstATop,
            ),
            fit: BoxFit.cover,
            image: const AssetImage("assets/images/worldMap.png"),
          ),
        ),
        child: Stack(children: [
          /*Positioned(
              //this is for random position on map
              top: math.Random().nextInt(80).toDouble(),
              right: math.Random().nextInt(110).toDouble(),
              child: const LocationMarker()),*/
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white54,
                ),
                Text(
                  location,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 20),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class ButtonArea extends StatelessWidget {
  const ButtonArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // color: Colors.yellow
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: const BoxDecoration(
                  color: Colors.white24,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(20))),
              child: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}
