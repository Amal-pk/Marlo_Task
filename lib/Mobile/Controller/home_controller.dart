import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:marlo_task/Service/service.dart';
import 'package:marlo_task/model/model.dart';

class HomeController extends ChangeNotifier {
  List<TransactionModel> data = [];
  void init() async {
    final BaseResponseModel? model = await ResponseService.getTransaction();
    if (model != null) {
      data.clear();
      data = (model.response.data as List<dynamic>)
          .map((e) => TransactionModel.fromJson(e))
          .toList();
    }
    log("List of Datas $data");
    notifyListeners();
  }

  bool isDate = false;
  bool isWeek = false;
  bool isToday = false;
  bool isMonth = false;
  bool isQuarter = false;
  bool isMoneyIn = false;
  bool isMoneyOut = false;
  bool isComplete = false;
  bool isPending = false;
  bool isCancel = false;
  bool isFailed = false;
  bool isDeclined = false;
  bool isReverted = false;
  List<String> items = [];
  String moneyData = "";
  String statusData = "";
  String timeData = "";
  isTrue(String inOrOut) {
    if (inOrOut == "Money in") {
      isMoneyIn = !isMoneyIn;
      isMoneyOut = false;
    } else {
      isMoneyOut = !isMoneyOut;
      isMoneyIn = false;
    }
  }

  isSelect(String index) {
    if (isMoneyIn == true || isMoneyOut == true) {
      moneyData = index;
    } else {}
    log(items.length.toString());
    notifyListeners();
  }

  isStatus(String inOrOut) {
    if (inOrOut == "Completed") {
      isComplete = !isComplete;
      isPending = false;
      isCancel = false;
      isFailed = false;
      isDeclined = false;
      isReverted = false;
    } else if (inOrOut == "Pending") {
      isPending = !isPending;
      isComplete = false;
      isCancel = false;
      isFailed = false;
      isDeclined = false;
      isReverted = false;
    } else if (inOrOut == "Failed") {
      isPending = false;
      isComplete = false;
      isCancel = false;
      isFailed = !isFailed;
      isDeclined = false;
      isReverted = false;
    } else if (inOrOut == "Declined") {
      isPending = false;
      isComplete = false;
      isCancel = false;
      isFailed = false;
      isDeclined = !isDeclined;
      isReverted = false;
    } else if (inOrOut == "Reverted") {
      isPending = false;
      isComplete = false;
      isCancel = false;
      isFailed = false;
      isDeclined = false;
      isReverted = !isReverted;
    } else {
      isCancel = !isCancel;
      isComplete = false;
      isPending = false;
      isFailed = false;
      isDeclined = false;
      isReverted = false;
    }
    notifyListeners();
  }

  isSelectStatus(String index) {
    if (isCancel == true ||
        isComplete == true ||
        isPending == true ||
        isFailed == true ||
        isDeclined == true ||
        isReverted == true) {
      statusData = index;
    } else {}
    items.add(index);
    log(items.length.toString());
    notifyListeners();
  }

  isTime(String inOrOut) {
    if (inOrOut == "18 Jan-2 Feb") {
      isDate = !isDate;
      isWeek = false;
      isToday = false;
      isMonth = false;
      isQuarter = false;
    } else if (inOrOut == "Today") {
      isDate = false;
      isWeek = false;
      isToday = !isToday;
      isMonth = false;
      isQuarter = false;
    } else if (inOrOut == "This Week") {
      isDate = false;
      isWeek = !isWeek;
      isToday = false;
      isMonth = false;
      isQuarter = false;
    } else if (inOrOut == "This Month") {
      isDate = false;
      isWeek = false;
      isToday = false;
      isMonth = !isMonth;
      isQuarter = false;
    } else {
      isDate = false;
      isWeek = false;
      isToday = false;
      isMonth = false;
      isQuarter = !isQuarter;
    }
    notifyListeners();
  }

  isSelectTime(String index) {
    if (isDate == true ||
        isWeek == true ||
        isToday == true ||
        isMonth == true ||
        isQuarter == true) {
      timeData = index;
    } else {}

    log(items.length.toString());
    notifyListeners();
  }

  isApply() {
    items.clear();
    items.add(moneyData);
    items.add(statusData);
    items.add(timeData);
    notifyListeners();
  }

  isRemove(int index) {
    items.removeAt(index);
    notifyListeners();
  }
}
