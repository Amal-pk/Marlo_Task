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
  }

  bool isMoneyIn = false;
  bool isMoneyOut = false;
  bool isComplete = false;
  bool isPending = false;
  bool isCancel = false;
  bool isFailed = false;
  bool isDeclined = false;
  bool isReverted = false;
  List<String> items = [];

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
      items.clear();
      items.add(index);
    } else {
      items.remove(index);
    }
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
  }

  isSelectStatus(String index) {
    if (isCancel == true ||
        isComplete == true ||
        isPending == true ||
        isFailed == true ||
        isDeclined == true ||
        isReverted == true) {
      // items.clear();
      items.add(index);
    } else {
      items.remove(index);
    }
    log(items.length.toString());
    notifyListeners();
  }
}
