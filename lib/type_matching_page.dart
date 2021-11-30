import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'main.dart';

class TypeMatching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Type Matching',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: TypeMatchingPage(title: 'Type Matching'),
    );
  }
}

class TypeMatchingPage extends StatefulWidget {
  TypeMatchingPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TypeMatchingPageState createState() => _TypeMatchingPageState();
}

class _TypeMatchingPageState extends State<TypeMatchingPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        //TODO: Make sure to figure out how add icon in title
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Image.asset(
        //   "assets/pokemonicon1.png",
        //   ),
        // ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: itemData.length,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 1,
              children: [
                ExpansionPanel(
                  body: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipOval(
                          child: CircleAvatar(
                            child: Image.asset(
                              itemData[index].img,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          itemData[index].description,
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 15,
                              letterSpacing: 0.3,
                              height: 1.3),
                        ),
                      ],
                    ),
                  ),
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        itemData[index].headerItem,
                        style: TextStyle(
                          color: itemData[index].colorsItem,
                          fontSize: 18,
                        ),
                      ),
                    );
                  },
                  isExpanded: itemData[index].expanded,
                )
              ],
              expansionCallback: (int item, bool status) {
                setState(() {
                  itemData[index].expanded = !itemData[index].expanded;
                });
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 100.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Text('Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Home Page'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: const Text('Type Matching'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pushNamed(context, '/second');
              },
            ),
          ],
        ),
      ),
    );
  }
  List<ItemModel> itemData = <ItemModel>[
    ItemModel(
        headerItem: 'Normal',
        description:
        "Super Effective (2x Damage from):\nFighting"
            "\n\nNo Effect (0x Damage from):\nGhost",
        colorsItem: Color(0xFFA4A9AC),
        img: 'assets/types_icons/normal_type.ico'
    ),
    ItemModel(
        headerItem: 'Fire',
        description:
        "Super Effective (2x Damage from):\nWater, Ground, Rock"
            "\n\nNot Effective (1/2x Damage from):\nFire, Grass, Ice, Bug, Steel, Fairy",
        colorsItem: Colors.red,
        img: 'assets/types_icons/fire_type.ico'
    ),
    ItemModel(
        headerItem: 'Water',
        description:
        "Super Effective (2x Damage from):\nElectric, Grass"
            "\n\nNot Effective (1/2x Damage from):\nFire, Water, Ice, Steel",
        colorsItem: Colors.blue,
        img: 'assets/types_icons/water_type.ico'
    ),
    ItemModel(
        headerItem: 'Grass',
      description:
        "Super Effective (2x Damage from):\nFire, Ice, Poison, Flying, Bug"
        "\n\nNot Effective (1/2x Damage from):\nWater, Electric, Grass, Ground",
        colorsItem: Colors.green,
        img: 'assets/types_icons/grass_type.ico'
    ),
    ItemModel(
        headerItem: 'Electric',
        description:
        "Super Effective (2x Damage from):\nGround"
            "\n\nNot Effective (1/2x Damage from):\nElectric, Flying, Steel",
        colorsItem: Color(0xFFDCBF02),
        img: 'assets/types_icons/electric_type.ico'
    ),
    ItemModel(
        headerItem: 'Ice',
        description:
        "Super Effective (2x Damage from):\nFire, Fighting, Rock, Steel"
            "\n\nNot Effective (1/2x Damage from):\Ice",
        colorsItem: Color(0xFF7DC6F3),
        img: 'assets/types_icons/ice_type.ico'
    ),
    ItemModel(
        headerItem: 'Fighting',
        description:
        "Super Effective (2x Damage from):\nFlying, Psychic, Fairy"
            "\n\nNot Effective (1/2x Damage from):\nBug, Rock, Dark",
        colorsItem: Color(0x798B1414),
        img: 'assets/types_icons/fighting_type.ico'
    ),
    ItemModel(
        headerItem: 'Poison',
        description:
        "Super Effective (2x Damage from):\nGround, Psychic"
            "\n\nNot Effective (1/2x Damage from):\nGrass, Fighting, Poison, Bug, Fairy",
        colorsItem: Color(0x56FA2BB3),
        img: 'assets/types_icons/poison_type.ico'
    ),
    ItemModel(
        headerItem: 'Ground',
        description:
        "Super Effective (2x Damage from):\nWater, Grass, Ice"
            "\n\nNot Effective (1/2x Damage from):\nPoison, Rock"
            "\n\nNo Effect (0x Damage from):\nElectric",
        colorsItem: Color(0xB8DCA77E),
        img: 'assets/types_icons/ground_type.ico'
    ),
    ItemModel(
        headerItem: 'Flying',
        description:
        "Super Effective (2x Damage from):\nElectric, Ice, Rock"
            "\n\nNot Effective (1/2x Damage from):\nGrass, Fighting, Bug"
            "\n\nNo Effect (0x Damage from):\nGround",
        colorsItem: Color(0xF2CC9DF3),
        img: 'assets/types_icons/flying_type.ico'
    ),
    ItemModel(
        headerItem: 'Psychic',
        description:
        "Super Effective (2x Damage from):\nBug, Ghost, Dark"
            "\n\nNot Effective (1/2x Damage from):\nFighting, Psychic",
        colorsItem: Color(0xDDFF0379),
        img: 'assets/types_icons/psychic_type.ico'
    ),
    ItemModel(
        headerItem: 'Bug',
        description:
        "Super Effective (2x Damage from):\nFire, Flying, Rock"
            "\n\nNot Effective (1/2x Damage from):\nGrass, Fighting, Ground",
        colorsItem: Color(0xD2A9D557),
        img: 'assets/types_icons/bug_type.ico'
    ),
    ItemModel(
        headerItem: 'Rock',
        description:
        "Super Effective (2x Damage from):\nWater, Grass, Fighting, Ground, Steel"
            "\n\nNot Effective (1/2x Damage from):\nNormal, Fire, Poison, Flying",
        colorsItem: Color(0x8B873A06),
        img: 'assets/types_icons/rock_type.ico'
    ),
    ItemModel(
        headerItem: 'Ghost',
        description:
        "Super Effective (2x Damage from):\nGhost, Dark"
            "\n\nNot Effective (1/2x Damage from):\nPoison, Bug"
            "\n\nNo Effect (0x Damage from):\nNormal, Fighting",
        colorsItem: Color(0x4B942AEC),
        img: 'assets/types_icons/ghost_type.ico'
    ),
    ItemModel(
        headerItem: 'Dragon',
        description:
        "Super Effective (2x Damage from):\nIce, Dragon, Fairy"
            "\n\nNot Effective (1/2x Damage from):\nFire, Water, Grass, Electric",
        colorsItem: Color(0xF37A01DE),
        img: 'assets/types_icons/dragon_type.ico'
    ),
    ItemModel(
        headerItem: 'Dark',
        description:
        "Super Effective (2x Damage from):\nFighting, Bug, Fairy"
            "\n\nNot Effective (1/2x Damage from):\nGhost, Dark"
            "\n\nNo Effect (0x Damage from):\nPsychic",
        colorsItem: Color(0x99492600),
        img: 'assets/types_icons/dark_type.ico'
    ),
    ItemModel(
        headerItem: 'Steel',
        description:
        "Super Effective (2x Damage from):\nFire, Fighting, Ground"
            "\n\nNot Effective (1/2x Damage from):\nNormal, Grass, Ice, Flying, "
            "\nPsychic, Bug, Rock, Dragon, Steel, Fairy"
            "\n\nNo Effect (0x Damage from):\nPoison",
        colorsItem: Color(0xAE888389),
        img: 'assets/types_icons/steel_type.ico'
    ),
    ItemModel(
        headerItem: 'Fairy',
        description:
        "Super Effective (2x Damage from):\nPoison, Steel"
            "\n\nNot Effective (1/2x Damage from):\nFighting, Bug, Dark"
            "\n\nNo Effect (0x Damage from):\nDragon",
        colorsItem: Color(0xF7EE41C9),
        img: 'assets/types_icons/fairy_type.ico'
    ),
  ];
}

class ItemModel {
  bool expanded;
  String headerItem;
  String description;
  Color colorsItem;
  String img;

  ItemModel({this.expanded: false, required this.headerItem, required this.description, required this.colorsItem, required this.img});
}
