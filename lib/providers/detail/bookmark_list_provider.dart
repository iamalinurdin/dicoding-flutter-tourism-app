import 'package:flutter/widgets.dart';
import 'package:tourism_app/data/models/tourims_model.dart';

class BookmarkListProvider extends ChangeNotifier {
  final List<Tourism> _bookmarkList = [];

  List<Tourism> get bookmarkList => _bookmarkList;

  void addBookmark(Tourism tourism) {
    _bookmarkList.add(tourism);
    notifyListeners();
  }

  void removeBookmark(Tourism tourism) {
    _bookmarkList.removeWhere((item) => item.id == tourism.id);
    notifyListeners();
  }

  bool checkItemBookmark(Tourism tourism) {
    final item = _bookmarkList.where((i) => i.id == tourism.id);

    return item.isNotEmpty;
  }
}
