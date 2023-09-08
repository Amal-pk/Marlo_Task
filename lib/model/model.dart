class BaseResponseModel {
  int httpStatusCode;
  Response response;

  BaseResponseModel({
    required this.httpStatusCode,
    required this.response,
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
      BaseResponseModel(
        httpStatusCode: json["http_status_code"],
        response: Response.fromJson(json["response"]),
      );
}

class Response {
  String errorFlag;
  String message;
  dynamic data;

  Response({
    required this.errorFlag,
    required this.message,
    required this.data,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        errorFlag: json["error_flag"],
        message: json["message"],
        data: json["data"],
      );
}

class TransactionModel {
  String id;
  String amount;
  String status;
  String sourceId;
  String sourceType;
  String transactionType;
  String currency;
  DateTime createdAt;
  String fee;
  String description;
  DateTime settledAt;
  DateTime estimatedSettledAt;
  String currency1;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.status,
    required this.sourceId,
    required this.sourceType,
    required this.transactionType,
    required this.currency,
    required this.createdAt,
    required this.fee,
    required this.description,
    required this.settledAt,
    required this.estimatedSettledAt,
    required this.currency1,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"],
        amount: json["amount"],
        status: json["status"],
        sourceId: json["sourceId"],
        sourceType: json["sourceType"],
        transactionType: json["transactionType"],
        currency: json["currency"],
        createdAt: DateTime.parse(json["createdAt"]),
        fee: json["fee"],
        description: json["description"],
        settledAt: DateTime.parse(json["settledAt"]),
        estimatedSettledAt: DateTime.parse(json["estimatedSettledAt"]),
        currency1: json["currency1"],
      );
}
