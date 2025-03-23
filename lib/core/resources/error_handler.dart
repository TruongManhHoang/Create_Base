import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  String message = "Something went wrong";

  DioExceptions.fromDioError(DioException dioError) {
    print("DIO ERROR");
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        // print(dioError.response?.data);
        // message = _handleError(
        //   dioError.response?.statusCode,
        //   dioError.response?.data,
        // );
        print(dioError.response!.data);
        final errorData = dioError.response!.data['error'];
        // // print(errorData['message'].join(', '));

        if (errorData is Map<String, dynamic> && errorData.containsKey('message')) {
          if(errorData['message'] is List && errorData['message'].isNotEmpty) {
            message = (errorData['message'] as List).first.toString();
          } else {
            message = errorData['message'];
          }
        } else {
          message = errorData;
        }
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
        if ((dioError.message ?? "").contains("SocketException")) {
          message = 'No Internet';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error;
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
