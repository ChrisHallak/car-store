import 'dart:io';


import 'package:car_store/core/result.dart';
import 'package:dio/dio.dart';



mixin ErrorHandler on Object {

  handleError(DioException error) {

    if (error.type == DioExceptionType.unknown ||
        error.type == DioExceptionType.badResponse) {

      if(error is SocketException) return SocketError();

      if (error.type == DioExceptionType.badResponse) {
        switch (error.response!.statusCode) {
          case 400:
            return BadRequestError();
          case 401:
            return UnauthorizedError();
          case 403:
            return ForbiddenError();
          case 404:
            return NotFoundError();
          case 409:
            return ConflictError();
          case 500:
            return InternalServerError();
          default:
            return HttpError();
        }
      }
      return NetError();
    }else if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return TimeoutError();
    } else if (error.type == DioExceptionType.cancel) {
      return CancelError();
    } else {
      return UnknownError();
    }
  }
}


class ConnectionError extends BaseError {
  @override
  List<Object> get props => [];
}


class BadRequestError extends HttpError {

  @override
  String toString() {
    return 'Bad request, Please try again in a minute';
  }
}



class UnauthorizedError extends HttpError {
  @override
  String toString() {
    return 'You are unauthorized to do this action';
  }
}


class ForbiddenError extends HttpError implements Exception {
  @override
  String toString() {
    return 'Forbidden';
  }
}

class NotFoundError extends HttpError {
  @override
  String toString() {
    return 'Not found';
  }
}


class ConflictError extends HttpError {
  @override
  String toString() {
    return 'Something went wrong, Please try again in a minute';
  }
}



class InternalServerError extends HttpError {
  @override
  String toString() {
    return 'Server Down, Please try again in a minute';
  }
}



class HttpError extends BaseError {

  @override
  String toString() {
    return 'Something went wrong, Please try again in a minute';
  }
  @override
  List<Object> get props => [];
}


class NetError extends ConnectionError {

  @override
  String toString() {
    return "please check your connection.";
  }
}


class TimeoutError extends ConnectionError {
  @override
  String toString() {
    return "please check your connection.";
  }
}


class CancelError extends BaseError {
  @override
  List<Object> get props => [];
}



class UnknownError extends ConnectionError {

  @override
  String toString() {
    return "Something went wrong!";
  }
}


class SocketError extends ConnectionError {

  @override
  String toString() {
    return 'Socket Error, Please try again in a minute';
  }
}