import 'package:palace_core/src/http/request/request.dart';

extension ReqGetters on Request {
  String get contentType => request.headers.contentType.toString();
}
