import 'package:coffeestore/core/model/drink_list_model.dart';
import 'package:coffeestore/core/model/drink_model.dart';
import 'package:coffeestore/ui/widget/drink_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DrrinkListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext scaffoldContext) {
    String _alertDialogTitle = "Order";
    String _alertDialogContent = "Price : ";
    return ScopedModelDescendant<DrinkListModel>(
      builder: (context, _, model) {
        return Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: model.drinkType.map((drinkType) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: scaffoldContext,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        title: _alertDialogTitleText(_alertDialogTitle),
                        content: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.blue[900]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _alertDialogImage(drinkType),
                              _alertDialogInfo(drinkType, _alertDialogContent),
                            ],
                          ),
                        ),
                        actions: [
                          _cancelButton(dialogContext),
                          _sendButton(dialogContext, drinkType, context),
                        ],
                      );
                    },
                  );
                },
                child: DrinkCardWidget(
                  drinkType: drinkType,
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  _alertDialogInfo(DrinkModel drinkType, String _alertDialogContent) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _alertDialogContentTitle(drinkType),
          _alertDialogContentPrice(_alertDialogContent, drinkType),
        ],
      ),
    );
  }

  _sendButton(
      BuildContext dialogContext, DrinkModel drinkType, BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(dialogContext);
        final snackBar = SnackBar(
          backgroundColor: Colors.white,
          duration: Duration(
            seconds: 4,
          ),
          content: Text(
            '${drinkType.title} order confirmed.',
            style: TextStyle(
              color: Colors.blue[900],
              fontSize: 18.0,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Text(
        "Send",
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.blue[900],
        ),
      ),
    );
  }

  _cancelButton(BuildContext dialogContext) {
    return TextButton(
      onPressed: () {
        Navigator.pop(dialogContext);
      },
      child: Text(
        "Cancel",
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.blue[900],
        ),
      ),
    );
  }

  _alertDialogContentPrice(String _alertDialogContent, DrinkModel drinkType) {
    return Text(
      _alertDialogContent + "\$${drinkType.price}",
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }

  _alertDialogContentTitle(DrinkModel drinkType) {
    return Text(
      drinkType.title,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  _alertDialogImage(DrinkModel drinkType) {
    return Image.asset(
      drinkType.image,
      height: 100.0,
      width: 100.0,
      fit: BoxFit.cover,
    );
  }

  _alertDialogTitleText(String _alertDialogTitle) {
    return Text(
      _alertDialogTitle,
      style: TextStyle(color: Colors.blue[900]),
    );
  }
}
