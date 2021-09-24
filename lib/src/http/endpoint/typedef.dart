part of 'endpoint.dart';

typedef HandlerFunc = FutureOr<Object?> Function(
  Request req,
  Response res,
);
typedef GuardFunc = FutureOr<Object?> Function(
  Request req,
  Response res,
  Function() next,
);
