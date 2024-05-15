import 'package:flutter/material.dart';

class SanctuaryModel {
  String name;
  String imageUrl;
  String location;
  String description;
  Color bgColor;

  SanctuaryModel({
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.description,
    required this.bgColor,
  });
}

List<SanctuaryModel> sanctuaryData = [
  SanctuaryModel(
      name: "Thattekad Bird Sanctuary",
      imageUrl: "assests/Thattekad.jpg",
      location: "Kothamangalam, Ernakulam",
      description:
          "Salim Ali Bird Sanctuary/Thattekad Bird Sanctuary is the first bird sanctuary in Kerala.  Bird watchers are keen to visit this sanctuary between November to February during which they can spot migratory birds. Avian Fauna includes Sri Lankan Frogmouth, Malabar Gray Hornbill, Racket-tailed Drongo, Bronzed Drongo, Yellow-Brood Bulbul, Rufus Babbler, White-Bellied Treepie, Jungle Myna, Malabar Parakeet, Common Myna, Black Cormorant, Whistling Duck, Red Kingfisher, Water Hen, Yellow Oriole, Little Tern, Rufous Woodpecker, Crested Eagle, etc.",
      bgColor: const Color(0xff5e6152)),
  SanctuaryModel(
      name: "Kumarakom Bird Sanctuary",
      imageUrl: "assets/Kumarakom.png",
      location: "Kumarakom, Kottayam",
      description:
          "Kumarakom Bird Sanctuary is one of the top bird-watching destinations in India. It is situated at Kumarakom, in the Kottayam district of Kerala, on the banks of Vembanad Lake. The best time to visit Kumarakom Bird Sanctuary is between June and August. To watch migratory birds at Kumarakom Bird Sanctuary, November to February is the ideal time. Avian Fauna includes Kingfishers, owls, parrots, woodpeckers, and Indian darter, as well as migratory birds like Siberian cranes, various species of herons, darters, bitterns, Brahminy kites, Marsh Harriers, teals, larks and flycatchers.",
      bgColor: const Color(0xFF514CA5)),
  SanctuaryModel(
      name: "Kadalundi Bird Sanctuary",
      imageUrl: "assets/nilgiri-wood-pigeon.png",
      location: "Kadalundi, Kozhikode",
      description:
          "Kadalundi Bird Sanctuary is one of the best birding areas in Kerala that offers its visitors a unique chance of watching rare avian species. November to April is considered the ideal time to visit Kadalundi Bird Sanctuary as you can spot a lot of migratory birds here during this season. Avian Fauna includes  Brahminy Kites, Seagulls, Herons, Cormorants, Red and Greenshanks, Terns, Sandpipers, Sand Plovers, and Turnstones.",
      bgColor: const Color(0xFFA54C93)),
  SanctuaryModel(
      name: "Mangalavanam Bird Sanctuary",
      imageUrl: "assets/malabar.png",
      location: "Marine Drive, Kochi, Ernakulam",
      description:
          "Being the nesting ground of a large variety of migratory birds, Mangalavanam Bird Sanctuary is an attractive destination for birdwatchers and twitchers. Well-known as the “Green lung of Kochi“, Mangalavanam is an ecologically sensitive area, situated in the middle of Kerala’s metro city, Kochi. Avian Fauna includes Little Cormorant and Black-Crowned Night Heron, besides several other bird species. ",
      bgColor: const Color(0xFF614848)),
  SanctuaryModel(
      name: "Pakshipathalam Bird Sanctuary",
      imageUrl: "assets/nilgiri-flycatcher.png",
      location: "Wayanad",
      description:
          "Pakshipathalam Bird Sanctuary in Wayanad is a haven for trekkers who love birds. The steep hills, virgin forests, and charming streams together offer challenging avenues for trekking. It is home to some of the rarest avian species. Avian Fauna includes  Edible Nest Swift Light, Peacock, Woodpecker, Cuckoo, Babbler, Owl, and Jungle Fowl, along with many exotic species.",
      bgColor: const Color(0xFF614848)),
  SanctuaryModel(
      name: "Pathiramanal Island",
      imageUrl: "assets/nilgiri-pipit(1).png",
      location: "Alappuzha",
      description:
          "Pathiramanal Island is situated on the beautiful backwaters of Alleppey is home to hundreds of rare birds that migrates from different parts of the world. It is surrounded by the Vembanad Lake. Avian Fauna includes Rare Monarch Flycatchers, Cormorants, Gulls, Egrets, Darters, Kingfishers, and many other exotic species.",
      bgColor: const Color(0xFF486061)),
 
  
];

