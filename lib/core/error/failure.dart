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
      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request to api server was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure(message: 'Connection error with Api server');
      case DioExceptionType.unknown:
        return ServerFailure(message: 'Unexpected error occured');
    }
  }
}

class CacheFailure extends failure {
  CacheFailure({required String message}) : super(message: message);
}
