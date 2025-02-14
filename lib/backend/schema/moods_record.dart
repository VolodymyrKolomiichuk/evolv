import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoodsRecord extends FirestoreRecord {
  MoodsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "mood_score" field.
  int? _moodScore;
  int get moodScore => _moodScore ?? 0;
  bool hasMoodScore() => _moodScore != null;

  // "mood_reasons" field.
  List<String>? _moodReasons;
  List<String> get moodReasons => _moodReasons ?? const [];
  bool hasMoodReasons() => _moodReasons != null;

  // "mood_note" field.
  String? _moodNote;
  String get moodNote => _moodNote ?? '';
  bool hasMoodNote() => _moodNote != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _moodScore = castToType<int>(snapshotData['mood_score']);
    _moodReasons = getDataList(snapshotData['mood_reasons']);
    _moodNote = snapshotData['mood_note'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('moods');

  static Stream<MoodsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoodsRecord.fromSnapshot(s));

  static Future<MoodsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoodsRecord.fromSnapshot(s));

  static MoodsRecord fromSnapshot(DocumentSnapshot snapshot) => MoodsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoodsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoodsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoodsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoodsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;

  @override
  Map<String, DebugDataField> toDebugSerializableMap() => {
        'reference': debugSerializeParam(
          reference,
          ParamType.DocumentReference,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: '',
          nullable: false,
        ),
        'id': debugSerializeParam(
          id,
          ParamType.String,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'String',
          nullable: false,
        ),
        'user_id': debugSerializeParam(
          userId,
          ParamType.String,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'String',
          nullable: false,
        ),
        'mood_score': debugSerializeParam(
          moodScore,
          ParamType.int,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'int',
          nullable: false,
        ),
        'mood_reasons': debugSerializeParam(
          moodReasons,
          ParamType.String,
          isList: true,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'String',
          nullable: false,
        ),
        'mood_note': debugSerializeParam(
          moodNote,
          ParamType.String,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'String',
          nullable: false,
        ),
        'created_at': debugSerializeParam(
          createdAt,
          ParamType.DateTime,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'DateTime',
          nullable: true,
        )
      };
}

Map<String, dynamic> createMoodsRecordData({
  String? id,
  String? userId,
  int? moodScore,
  String? moodNote,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'user_id': userId,
      'mood_score': moodScore,
      'mood_note': moodNote,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoodsRecordDocumentEquality implements Equality<MoodsRecord> {
  const MoodsRecordDocumentEquality();

  @override
  bool equals(MoodsRecord? e1, MoodsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.userId == e2?.userId &&
        e1?.moodScore == e2?.moodScore &&
        listEquality.equals(e1?.moodReasons, e2?.moodReasons) &&
        e1?.moodNote == e2?.moodNote &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(MoodsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.userId,
        e?.moodScore,
        e?.moodReasons,
        e?.moodNote,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is MoodsRecord;
}
