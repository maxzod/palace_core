import 'dart:io' as io;

import 'package:palace_core/palace_core.dart';

/// * contains simplified logic to extract data from the io req class
class Request {
  final io.HttpRequest request;

  static Future<Request> init(io.HttpRequest request, EndPoint endPoint) async {
    ///* set up request path params
    // final _pathParams = <String>[];
    // final _pathRegx = pathToRegExp(endPoint.path, parameters: _pathParams);
    // final match = _pathRegx.matchAsPrefix(request.uri.path);

    var _routeParams = <String, String>{};
    // if (match != null) _routeParams = extract(_pathParams, match);

    return Request._(
      request: request,
      params: _routeParams,

      ///* set up request query params
    );
  }

  Request._({
    required this.request,
    required this.params,
  });

  late Map<String, dynamic> body;

  /// ? getter part
  late Map<String, dynamic> params;

  /// the query parameters from the incoming request
  Map<String, dynamic> get queryParams => request.uri.queryParameters;

  /// the HttpRequest instance

  /// the HttpHeaders instance from the request
  io.HttpHeaders get headers => request.headers;

  /// the request method
  String get method => request.method;

  /// return the the request path
  String get path => request.uri.path;

  /// return the httpSession from the io request
  io.HttpSession get session => request.session;

  /// return the cookies from the io request=
  List<io.Cookie> get cookies => request.cookies;

  /// ip address of the request client
  String get ip => request.connectionInfo!.remoteAddress.address;
}
