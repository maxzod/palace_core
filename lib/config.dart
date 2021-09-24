import 'package:palace_core/palace_core.dart';

abstract class PalaceConfig {
  /// will be called in case of no match with any of the registered endpoints
  static HandlerFunc notFoundHandler = (req, res) => throw NotFound();

  ///
  static bool get enaleLogs => true;
}
