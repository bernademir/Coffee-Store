import 'package:coffeestore/core/model/drink_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

List<DrinkModel> mainTypes = <DrinkModel>[
  DrinkModel('coffee', 'assests/img/black-coffee.jpg', 4.50),
  DrinkModel('tea', 'assests/img/black-tea.jpg', 4.50),
  DrinkModel('juice', 'assests/img/lemon.jpg', 4.50),
  DrinkModel('smoothie', 'assests/img/apple-smoothie.jpg', 4.50),
];

List<DrinkModel> coffeeTypes = <DrinkModel>[
  DrinkModel('black coffee', 'assests/img/black-coffee.jpg', 4.50),
  DrinkModel('cappuccino', 'assests/img/cappuccino.jpg', 4.50),
  DrinkModel('espresso', 'assests/img/espresso.jpg', 4.50),
  DrinkModel('latte', 'assests/img/latte.jpg', 4.50),
];

List<DrinkModel> teaTypes = <DrinkModel>[
  DrinkModel('black tea', 'assests/img/black-tea.jpg', 4.50),
  DrinkModel('brown tea', 'assests/img/brown-tea.jpg', 4.50),
  DrinkModel('english tea', 'assests/img/english-tea.jpg', 4.50),
  DrinkModel('herbal tea', 'assests/img/herbal-tea.jpg', 4.50),
  DrinkModel('mint tea', 'assests/img/mint-tea.jpg', 4.50),
];

List<DrinkModel> smoothieTypes = <DrinkModel>[
  DrinkModel('apple smoothie', 'assests/img/apple-smoothie.jpg', 4.50),
  DrinkModel('blackberry smoothie', 'assests/img/black-smoothie.jpg', 4.50),
  DrinkModel('kiwi smoothie', 'assests/img/kiwi-smoothie.jpg', 4.50),
  DrinkModel('raspberry smoothie', 'assests/img/raspberry-smoothie.jpg', 4.50),
];

List<DrinkModel> juiceTypes = <DrinkModel>[
  DrinkModel('lemon juice', 'assests/img/lemon.jpg', 4.50),
  DrinkModel('lime juice', 'assests/img/lime.jpg', 4.50),
  DrinkModel('pink grape juice', 'assests/img/pink-grape.jpg', 4.50),
  DrinkModel('plum juice', 'assests/img/plum.jpg', 4.50),
  DrinkModel('tomato juice', 'assests/img/tomato.jpg', 4.50),
];

class DrinkCardWidget extends StatelessWidget {
  final DrinkModel drinkType;

  const DrinkCardWidget({Key key, this.drinkType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4.0),
      child: Center(
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: AssetImage(
                drinkType.image,
              ),
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
              fadeInDuration: Duration(
                milliseconds: 500,
              ),
              fadeInCurve: Curves.easeIn,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue[900].withOpacity(0.7),
                  ),
                  child: Text(
                    drinkType.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0),
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
