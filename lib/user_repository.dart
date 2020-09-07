import 'package:dio/dio.dart';

class UserRepository {
  Future<Response> getUsers() async {
    try {
      Response response = await new Dio().get(
        "https://reqres.in/api/users",
      );
      return response;
    } on DioError catch (exception) {
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        return exception.response;
      } else if (exception.type == DioErrorType.RECEIVE_TIMEOUT ||
          exception.type == DioErrorType.CONNECT_TIMEOUT) {
        return exception.response;
      } else {
        return exception.response;
      }
    }
  }
}
