import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioErrorType.sendTimeout:
        return ServerFailure('send timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFailure('receive timeout with ApiServer');
      case DioErrorType.badCertificate:
        return ServerFailure('Connection timeout with ApiServer');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('request to ApiServer was canseled');
      case DioErrorType.connectionError:
        return ServerFailure(
            'there is an connection error, Please try again later :)');
      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketExeption')) {
          return ServerFailure("No Internet Connection");
        }
        return ServerFailure("Unexpected Error! Please try again");
      default:
        return ServerFailure("Opps there was an Error, Please try again");
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Your request not Found, Please try again later :)");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server error, Please try again later :)");
    } else {
      return ServerFailure("Opps there was an Error, Please try again");
    }
  }
}
