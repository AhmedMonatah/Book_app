 import 'package:dio/dio.dart';

class ApiService{
  final Dio _dio ;
  final baseUrl='https://www.googleapis.com/books/v1';
  ApiService(this._dio);
  
  Future<Map<String,dynamic>> get({required String url}) async {
  
    final response = await _dio.get(baseUrl+url);
    return response.data;
  }
 }