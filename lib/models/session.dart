import 'package:flutter/foundation.dart';

import './program.dart';

class Session {
  final String id;
  final DateTime date;
  final Duration duration;
  final ProgramDay programDay;

  Session({
    @required this.id,
    @required this.date,
    @required this.duration,
    @required this.programDay,
  });
}
