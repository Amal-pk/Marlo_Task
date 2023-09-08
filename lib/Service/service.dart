import 'dart:developer';

import 'package:marlo_task/Constant/constant.dart';
import 'package:marlo_task/model/model.dart';

class ResponseService {
  static Future<BaseResponseModel?> getTransaction() async {
    try {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      final BaseResponseModel responseModel =
          BaseResponseModel.fromJson(ClassResponse.responseJson);
      if (responseModel.httpStatusCode <= 200 ||
          responseModel.httpStatusCode >= 299) {
        return responseModel;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }
}
