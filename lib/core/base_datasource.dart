import 'dart:io';
import 'package:car_store/core/result.dart';
import 'package:dartz/dartz.dart';
//import 'package:package_info_plus/package_info_plus.dart';
import 'api_helper.dart';
import 'api_params.dart';
import 'error/exceptions.dart';
import 'factory.dart';

abstract class FunctionInstance<T> {
  final dynamic _function;
  final List<T> _arguments;

  FunctionInstance(this._function, this._arguments);

  dynamic invokeWithNewToken(String token);
}

class ApiCallFunction extends FunctionInstance<ApiCallParams> {
  ApiCallFunction(dynamic function, List<ApiCallParams> arguments)
      : super(function, arguments);

  invoke<T>() {
    return Function.apply(_function, [..._arguments]);
  }

  @override
  invokeWithNewToken(String token) {
    (_arguments as ApiCallParams).changeToken(token);
    List<dynamic> allArgs = [..._arguments, ...[]];

    return Function.apply(_function, allArgs);
  }
}


mixin RefreshableRemote {
  Map<String, FunctionInstance> redoInvoker = {};

  void addFunction(String name, FunctionInstance function) {
    redoInvoker[name] = function;
  }

  void invokeFunctionWithNewToken(String name, String token) {
    if (!redoInvoker.containsKey(name)) {
      throw Exception("this command '$name' not found");
    }

    FunctionInstance instance = redoInvoker[name]!;
    instance.invokeWithNewToken(token);
  }

}

abstract class RemoteDataSource with RefreshableRemote {
  Future<Either<BaseError, Data>> request<Data, Response extends ApiResponse>(
      ApiCallParams<Response> params,
      ) async {
    ModelFactory.getInstance().registerModel(params.responseStr, params.mapper);

    final Map<String, String> headers = {};

    if (params.token != null && params.token!.isNotEmpty) {
      //headers.putIfAbsent(SessionManager.authorizeToken, () => 'Bearer ${params.token}');
      headers.putIfAbsent(SessionManager.authorizeToken, () => 'Bearer ${params.token}');
      print('token: ${params.token}');
    }
    //PackageInfo packageInfo = await PackageInfo.fromPlatform();

    //print('packageInfo.version: ${packageInfo.version}, ${Platform.operatingSystem}');

    headers.putIfAbsent('Content-Type', () => 'application/json');
    headers.putIfAbsent('Accept', () => 'application/json');
    // headers.putIfAbsent('Accept', () => '*/*');
    //headers.putIfAbsent('platformVersion', () => packageInfo.version);


    headers.putIfAbsent('platformActive', () => Platform.operatingSystem);
    headers.putIfAbsent('Connection', () => 'keep-alive');

    //  headers['content-Type'] = 'application/json';
    //  headers.putIfAbsent(LANGUAGE, () => acceptLang);

    print('data: ${params.data}');
    final response = await ApiHelper().sendRequest<Response>(
        method: params.method,
        url: params.url,
        data: params.data,
        headers: headers,
        cancelToken: params.cancelToken);

    print('123 123 Response: $response');

    if (response.isLeft()) {
      BaseError error = (response as Left<BaseError, Response>).value;
      return Left(error);
    } else if (response.isRight()) {
      final resValue = (response as Right<BaseError, Response>).value;
      print('has error : ${resValue.hasError}');
      if (resValue.hasError) return Left(CustomError(message: resValue.msg));
      return Right(resValue.result);
    }
    return left(UnknownError());
  }
}


class CustomError extends BaseError {
  final String message;

  CustomError({required this.message});

  @override
  String toString() {
    return message;
  }
  @override
  List<Object> get props => [];
}
class ApiResponse<T>{

  bool hasError;
  String msg;
  T result;

  ApiResponse(this.msg, this.hasError, this.result);
}

abstract class SessionManager {
  static const keyToken = "USER_TOKEN";
  static const refreshKeyToken = "REFRESH_USER_TOKEN";
  static const authorizeToken = "Authorization";

  Future<void> deleteToken();

  Future<void> deleteRefreshToken();

  Future<void> persistToken(String token);

  Future<void> persistRefreshToken(String token);

  Future<String> get authToken;

  Future<String> get refreshToken;

  Future<bool> get hasToken;
}




class UnknownError extends ConnectionError {

  @override
  String toString() {
    return "Something went wrong!";
  }
}