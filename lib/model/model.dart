class RestaurantModel {
    String httpStatusCode;
    Response response;

    RestaurantModel({
        required this.httpStatusCode,
        required this.response,
    });

    factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
        httpStatusCode: json["http_status_code"],
        response: Response.fromJson(json["response"]),
    );

    Map<String, dynamic> toJson() => {
        "http_status_code": httpStatusCode,
        "response": response.toJson(),
    };
}

class Response {
    String errorFlag;
    String message;
    List<Map<String, String?>> data;

    Response({
        required this.errorFlag,
        required this.message,
        required this.data,
    });

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        errorFlag: json["error_flag"],
        message: json["message"],
        data: List<Map<String, String?>>.from(json["data"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "error_flag": errorFlag,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
}
