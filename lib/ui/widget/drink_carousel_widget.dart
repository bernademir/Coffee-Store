import 'dart:async';

import 'package:coffeestore/core/model/drink_list_model.dart';
import 'package:coffeestore/ui/widget/drink_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DrinkCarouselWidget extends StatefulWidget {
  @override
  _DrinkCarouselWidgetState createState() => _DrinkCarouselWidgetState();
}

class _DrinkCarouselWidgetState extends State<DrinkCarouselWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  Timer _carouselTimer;

  @override
  void initState() {
    _tabController = TabController(
      length: coffeeTypes.length,
      vsync: this,
    );
    _carouselTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      _changeImage(delta: 1);
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _carouselTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.blue[900],
        )),
        child: Stack(
          children: [
            ScopedModelDescendant<DrinkListModel>(
              rebuildOnChange: false,
              builder: (context, _, model) {
                return _tabBar(model);
              },
            ),
            _tabPageSelector(),
            _backIcon(),
            _forwardIcon(),
          ],
        ),
      ),
    );
  }

  _forwardIcon() {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        onPressed: () {
          _changeImage(delta: 1, userInput: true);
        },
        icon: Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 20.0,
        ),
      ),
    );
  }

  _backIcon() {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () {
          _changeImage(delta: -1, userInput: true);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 20.0,
        ),
      ),
    );
  }

  _tabPageSelector() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: TabPageSelector(
          controller: _tabController,
          color: Colors.white,
          indicatorSize: 15.0,
          selectedColor: Colors.blue[900],
        ),
      ),
    );
  }

  TabBarView _tabBar(DrinkListModel model) {
    return TabBarView(
      controller: _tabController,
      children: mainTypes.map((drinkType) {
        return GestureDetector(
          onTap: () {
            var type;
            switch (drinkType.title) {
              case 'coffee':
                type = coffeeTypes;
                break;
              case 'tea':
                type = teaTypes;
                break;
              case 'juice':
                type = juiceTypes;
                break;
              case 'smoothie':
                type = smoothieTypes;
                break;
              default:
                throw '${drinkType.title} error';
            }
            _carouselTimer.cancel();
            model.updateDrinkList(type);
          },
          child: DrinkCardWidget(
            drinkType: drinkType,
          ),
        );
      }).toList(),
    );
  }

  void _changeImage({int delta, bool userInput = false}) {
    if (userInput) _carouselTimer.cancel();
    imageCache.clear();
    var newTabIndex = _tabController.index + delta;
    if (newTabIndex >= coffeeTypes.length) {
      newTabIndex = 0;
    } else if (newTabIndex < 0) {
      newTabIndex = coffeeTypes.length - 1;
    }
    _tabController.animateTo(
      newTabIndex,
      duration: Duration(
        milliseconds: 1000,
      ),
      curve: Curves.easeIn,
    );
  }
}
