import 'dart:io' as io;
import 'dart:io';

import 'package:palace_core/src/http/responses/json_encoder.dart';

/// * contains getters and logic to respond to incoming req
///
///

class Response {
  /// * response class
  /// * you `can` build from built in factories
  ////  create one from scratch  ? i don't think you might want to that but here if you want so.
  /// * in case of returning just plain Object
  /// * the framework will create one for you based on the collected data form you returned data and the Request
  /// * for example :-
  /// * GET => /users  and you returned Json object
  /// * so the response statusCode = StatusCode.ok and the contentType = ContentType.json  and so on ....
  var _isClosed = false;
  bool get isClosed => _isClosed;

  final int? statusCode;
  final io.ContentType? contentType;

  late final io.HttpRequest request;

  Response(
    this.request, {
    this.statusCode,
    this.contentType,
  });

  io.HttpResponse get response => request.response;

  io.HttpHeaders get headers => response.headers;

  void send(Object data) {
    _isClosed = true;
    response.write(data);
    // await response.close();
  }

  String toJson(Object data) {
    try {
      return palaceJsonEncoder(data);
    } catch (e) {
      return data.toString();
    }
  }

  int get defStatusCode {
    final _method = request.method.toUpperCase();
    if (_method == 'GET') {
      return io.HttpStatus.ok;
    } else if (_method == 'POST') {
      return io.HttpStatus.created;
    }
    return io.HttpStatus.badRequest;
  }

  void json(
    Object data, {
    int? statusCode,
  }) async {
    /// set the Response contentType to Json
    response.headers.contentType = ContentType.json;

    // / set the default status code
    response.statusCode = statusCode ?? defStatusCode;

    /// append the data to the response
    send(toJson(data));
  }
}
