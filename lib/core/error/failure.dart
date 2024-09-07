import 'package:dio/dio.dart';

abstract class failure {
  final String message;
  failure({required this.message});
}

class ServerFailure extends failure {
  ServerFailure({required String message}) : super(message: message);
  factory ServerFailure.fromDiorError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'Connection timeout with Api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'Send timeout with Api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: 'Receive timeout with Api server');
      case DioExceptionType.badCertificate:
        return ServerFailure(message: 'Bad certificate with Api server');
      case DioExceptionType.badResponse:
        return e.response != null
            ? ServerFailure.fromResponse(e.response!.statusCode, e.response!.data)
            : ServerFailure(message: 'Received invalid response from the server');      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request to api server was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure(message: 'Connection error with Api server');
      case DioExceptionType.unknown:
        return ServerFailure(message: 'Unexpected error occured');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode,dynamic response) {
    
    switch (statusCode) {
      case 400:
        return ServerFailure(message: 'Bad request');
      case 401:
        return ServerFailure(message: 'Unauthorized');
      case 403:
        return ServerFailure(message: 'Forbidden');
      case 404:
        return ServerFailure(message: 'Not found');
      case 409:
        return ServerFailure(message: 'Conflict');
      case 408:
        return ServerFailure(message: 'Request timeout');
      case 500:
        return ServerFailure(message: 'Internal server error');
      case 503:
        return ServerFailure(message: 'Service unavailable');
      default:
        return ServerFailure(message: response['message']);
    }
  }
}

class CacheFailure extends failure {
  CacheFailure({required String message}) : super(message: message);
}
