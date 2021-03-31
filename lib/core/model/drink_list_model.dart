import 'package:coffeestore/core/model/drink_model.dart';
import 'package:coffeestore/ui/widget/drink_card_widget.dart';
import 'package:scoped_model/scoped_model.dart';

class DrinkListModel extends Model {
  List<DrinkModel> _drinkType = coffeeTypes;
  List<DrinkModel> get drinkType => _drinkType;
  void updateDrinkList(List<DrinkModel> type) {
    _drinkType = type;
    notifyListeners();
  }
}
