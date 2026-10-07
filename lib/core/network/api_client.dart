import 'package:dio/dio.dart';

class ApiClient {
  Dio dio = Dio(BaseOptions(headers: {"token": "", "userId": "", "langCode": ""}));

  Future<Response?> getRequest(String url) async {
    return await dio.get(url);
  }

  Future<Response?> postRequest(String url) async {
    return await dio.post(url);
  }

  Future<Response?> patchRequest(String url) async {
    return await dio.patch(url);
  }

  Future<Response?> putRequest(String url) async {
    return await dio.put(url);
  }

  Future<Response?> deleteRequest(String url) async {
    return await dio.delete(url);
  }
}



// analysis
// Planning
// Validation
// Implementation


// DRY 
// WET 