
import 'package:flutter/material.dart';
import 'package:login/model/bird_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.bird});
  final BirdModel bird;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
             colors: [
              Color.fromARGB(255, 61, 138, 225),
              Color.fromARGB(255, 115, 142, 171),
            ],
          ),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                LeftSide(birdInfo: widget.bird),
                RightSide(birdInfo: widget.bird),
              ],
            ),
            Positioned(
              right: -mediaQuery.size.width * .14,
              child: Container(
                margin: EdgeInsets.fromLTRB(
                    5,
                    mediaQuery.padding.top + mediaQuery.size.height * .05,
                    5,
                    mediaQuery.padding.bottom),
                // color: Colors.green.withOpacity(.5),
                width: mediaQuery.size.width,
                height: mediaQuery.size.height * .5,
                child: Hero(
                  tag: widget.bird.name,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset(widget.bird.imageUrl),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RightSide extends StatelessWidget {
  const RightSide({super.key, required this.birdInfo});
  final BirdModel birdInfo;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        mediaQuery.padding.top,
        20,
        mediaQuery.padding.bottom,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(mediaQuery.size.width * .1),
          bottomLeft: Radius.circular(mediaQuery.size.width * .1),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
              Color.fromARGB(255, 61, 138, 225),
              Color.fromARGB(255, 115, 142, 171),
            ],
          /*colors: [
            Color(0xFF3a352f),
            Color(0xFF776d6d),
          ],*/
        ),
      ),
      width: mediaQuery.size.width * .35,
      
  
      );
    
  }
}

class LeftSide extends StatelessWidget {
  const LeftSide({super.key, required this.birdInfo});
  final BirdModel birdInfo;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.fromLTRB(
        25,
        mediaQuery.padding.top,
        25,
        mediaQuery.padding.bottom,
      ),
      width: mediaQuery.size.width * .65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: mediaQuery.size.width * .15,
            height: mediaQuery.size.width * .1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: mediaQuery.size.width * .07,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(.5),
                  ),
                ),
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(.5),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: mediaQuery.size.width * .4,
            height: mediaQuery.size.height * .3,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.2),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(mediaQuery.size.width * .6),
                bottomLeft: Radius.circular(mediaQuery.size.width * .4),
                bottomRight: Radius.circular(mediaQuery.size.width * .4),
              ),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(
                mediaQuery.size.width * .08,
                mediaQuery.size.width * .12,
                mediaQuery.size.width * .08,
                mediaQuery.size.width * .08,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(mediaQuery.size.width * .6),
                  bottomLeft: Radius.circular(mediaQuery.size.width * .4),
                  bottomRight: Radius.circular(mediaQuery.size.width * .4),
                ),
                border: Border.all(
                  width: 2,
                  color: Colors.amber,
                ),
              ),
            ),
          ),
          SizedBox(height: mediaQuery.size.height * .02),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(.5),
                ),
              ),
              Expanded(
                child: Text(
                  birdInfo.name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: mediaQuery.size.height * .02),
          Text(
            birdInfo.description,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              height: 1.4,
            ),
          ),
          SizedBox(height: mediaQuery.size.height * .03),
       
        ],
      ),
    );
  }
}
