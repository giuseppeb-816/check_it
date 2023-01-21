import 'package:firebase_database/firebase_database.dart';

class RealtimeDatabase {
  static void writeUser({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    try {
      DatabaseReference _databaseReference =
        FirebaseDatabase.instance.ref("users/$userId");

      await _databaseReference.set(data);
    } catch (e) {
      rethrow;
    }
  }

  static void writeGoal({
    required Map<String, dynamic> data,
  }) async {
    try {
      await FirebaseDatabase.instance.ref('goals').push().set(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> readUser({required String userId}) async {
    try {
      DatabaseReference _databaseReference =
        FirebaseDatabase.instance.ref("users/$userId");
      final snapshot = await _databaseReference.get();
      if (snapshot.exists) {
        Map<String, dynamic> _snapshotValue =
          Map<String, dynamic>.from(snapshot.value as Map);
        return _snapshotValue['name'] ?? '';
      } else {
        return '';
      }
    } catch (e) {
      rethrow;
    }
  }

  static void changeDoneStatus({
    required String goalId,
    required bool currentStatus,
  }) async {
    try {
      await FirebaseDatabase.instance.ref('goals/$goalId').update({'done': !currentStatus});
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<List<dynamic>>?> readCurrentUserGoals({required String userId}) async {
    try {
      List<String> _goals = [];
      List<bool> _done = [];
      List<String> _ids = [];
      DatabaseReference _databaseReference =
        FirebaseDatabase.instance.ref("goals");
      final snapshot = await _databaseReference.get();
      if (snapshot.exists) {
        for (final child in snapshot.children) {
          Map<String, dynamic> _snapshotValue =
            Map<String, dynamic>.from(child.value as Map);
          if (_snapshotValue['user_id'] == userId && _snapshotValue['current']) {
            _goals.add(_snapshotValue['name']);
            _done.add(_snapshotValue['done']);
            _ids.add(child.key!);
          }
        }
        return [_goals, _done, _ids];
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}