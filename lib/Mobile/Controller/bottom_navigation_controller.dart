import 'package:flutter/cupertino.dart';
import 'package:marlo_task/Mobile/View/home_page.dart';
import 'package:marlo_task/Mobile/View/loan.dart';

class BottomNavigationBarController extends ChangeNotifier {
  int currentIndex = 0;
  final List<dynamic> screens = [
    HomePage(),
    const LoanScreen(),
    const LoanScreen(),
    const LoanScreen(),
    const LoanScreen(),
  ];
  int currentIndexSearch() {
    return currentIndex;
  }

  currentIndexResult(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
