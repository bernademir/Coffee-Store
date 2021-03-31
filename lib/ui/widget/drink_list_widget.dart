import 'package:coffeestore/core/model/drink_list_model.dart';
import 'package:coffeestore/ui/widget/drink_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DrrinkListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<DrinkListModel>(
      builder: (context, _, model) {
        return Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: model.drinkType.map((drinkType) {
              return DrinkCardWidget(
                drinkType: drinkType,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
