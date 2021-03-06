import 'dart:convert';
import 'package:flutter/foundation.dart';

class Session {
  final String id;
  final DateTime date;
  final Duration duration;
  final String programDayId;
  final String programId;
  final List<String> completedExerciseIds;

  Session({
    @required this.id,
    @required this.date,
    @required this.duration,
    @required this.programDayId,
    @required this.programId,
    this.completedExerciseIds,
  });

  Map<String, dynamic> toDatabaseFormat() {
    final Map<String, dynamic> data = {
      'id': id,
      'date': date.toIso8601String(),
      'duration': duration == null ? 0 : duration.inSeconds,
      'programDayId': programDayId,
      'programId': programId,
      'completedExerciseIds':
          completedExerciseIds == null ? [] : json.encode(completedExerciseIds),
    };
    return data;
  }

  factory Session.fromDatabaseFormat(Map<String, dynamic> dbSession) => Session(
        id: dbSession['id'],
        date: DateTime.parse(dbSession['date']),
        duration: Duration(seconds: dbSession['duration']),
        programDayId: dbSession['programDayId'],
        programId: dbSession['programId'],
        completedExerciseIds: dbSession['completedExerciseIds'] == null
            ? []
            : List<String>.from(json.decode(dbSession['completedExerciseIds'])),
      );
}
