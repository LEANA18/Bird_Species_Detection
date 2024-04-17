import 'package:flutter/material.dart';

class BirdModel {
  String name;
  String imageUrl;
  String location;
  String description;
  Color bgColor;

  BirdModel({
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.description,
    required this.bgColor,
  });
}

List<BirdModel> birdData = [
  BirdModel(
      name: "Great Hornbill",
      imageUrl: "assets/great-hornbill.png",
      location: "Nilambur",
      description:
          "The Great hornbill (Buceros bicornis) is a large colorful bird found in the Indian subcontinent and Southeast. Due to its large size and color, it is important in many tribal cultures and rituals. The Government of Kerala declared it as the official Kerala state bird.",
      bgColor: const Color(0xff5e6152)),
  BirdModel(
      name: "Bar headed Goose",
      imageUrl: "assets/bar-headed-goose.png",
      location: "Pathanamthitta",
      description:
          "A Bar-headed Goose has been spotted in the wetlands of Karingali Puncha in Pathanamthitta District of Kerala. The wetlands of Karingali Puncha is a major birding spot in the district. ",
      bgColor: const Color(0xFF514CA5)),
  BirdModel(
      name: "Nilgiri Wood Pigeon",
      imageUrl: "assets/nilgiri-wood-pigeon.png",
      location: "Western Ghats",
      description:
          "Nilgiri wood pigeons are endemic to South India particularly in Western Ghats from Kerala to Bombay including Nilgiri, Palani and Anamalai Hills. The breeding season of these species is from March to July in the Western Ghats.",
      bgColor: const Color(0xFFA54C93)),
  BirdModel(
      name: "Malabar grey hornbill",
      imageUrl: "assets/malabar.png",
      location: "Western Ghats",
      description:
          "The Malabar gray hornbill (Ocyceros griseus) is a hornbill endemic to the Western Ghats and associated hills of southern India. They are found mainly in dense forest and around rubber, arecanut or coffee plantations.",
      bgColor: const Color(0xFF614848)),
  BirdModel(
      name: "Nilgiri flycatcher",
      imageUrl: "assets/nilgiri-flycatcher.png",
      location: "Nilgiris",
      description:
          "The Nilgiri flycatcher (Eumyias albicaudatus) is an Old World flycatcher with a very restricted range in the hills of southern India.",
      bgColor: const Color(0xFF614848)),
  BirdModel(
      name: "Nilgiri Pipit",
      imageUrl: "assets/nilgiri-pipit(1).png",
      location: "Western Ghats",
      description:
          "The Nilgiri pipit (Anthus nilghiriensis) is a distinctive species of pipit that is endemic to the high altitude hills of southern India.",
      bgColor: const Color(0xFF486061)),
 
  BirdModel(
      name: "Golden-fronted leafbird",
      imageUrl: "assets/golden-fronted-leafbird.png",
      location: "Thattekad Bird Sanctuary",
      description:
          "The golden-fronted leafbird (Chloropsis aurifrons) is a species of leafbird. It is found from the Indian subcontinent and south-western China, to south-east Asia and Sumatra.",
      bgColor: const Color(0xFF64443C)),
  BirdModel(
      name: "Asian fairy-bluebird",
      imageUrl: "assets/Asian fairy bluebird.png",
      location: "Thattekad Bird Sanctuary",
      description:
          "The Asian fairy-bluebird (Irena puella) is found in forests across tropical southern Asia, Indochina and the Greater Sundas. ",
      bgColor: const Color(0xFF589BBA)),
  BirdModel(
      name: "Blue-tailed Bee-eater",
      imageUrl: "assets/bluetailed.png",
      location: "Thattekad Bird Sanctuary",
      description:
          "The Blue-tailed Bee-eater (Merops philippinus) is a near passerine bird in the bee-eater family Meropidae. It breeds in southeastern Asia. It is strongly migratory, seen seasonally in much of peninsular India.",
      bgColor: const Color(0xFF447E37)),
  BirdModel(
      name: "Lesser whistling duck",
      imageUrl: "assets/lesser-whistling-duck.png",
      location: "Thattekad Bird Sanctuary",
      description:
          "The lesser whistling duck (Dendrocygna javanica), also known as Indian whistling duck or lesser whistling teal, is a species of whistling duck that breeds in the Indian subcontinent and Southeast Asia. They are nocturnal feeders that during the day may be found in flocks around lakes and wet paddy fields.",
      bgColor: const Color(0xFF7E3779)),
];

