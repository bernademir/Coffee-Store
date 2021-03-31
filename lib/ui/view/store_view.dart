import 'package:coffeestore/core/model/drink_list_model.dart';
import 'package:coffeestore/ui/widget/drink_carousel_widget.dart';
import 'package:coffeestore/ui/widget/drink_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StoreView extends StatelessWidget {
  final String title;

  const StoreView({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScopedModel<DrinkListModel>(
      model: DrinkListModel(),
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.blue[900],
        ),
        body: Column(
          children: [
            DrinkCarouselWidget(),
            DrrinkListWidget(),
          ],
        ),
      ),
    );
  }
}
