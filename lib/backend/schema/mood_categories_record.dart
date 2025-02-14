import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoodCategoriesRecord extends FirestoreRecord {
  MoodCategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mood_categories');

  static Stream<MoodCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoodCategoriesRecord.fromSnapshot(s));

  static Future<MoodCategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoodCategoriesRecord.fromSnapshot(s));

  static MoodCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MoodCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoodCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoodCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoodCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoodCategoriesRecord &&
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
        'name': debugSerializeParam(
          name,
          ParamType.String,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'String',
          nullable: false,
        )
      };
}

Map<String, dynamic> createMoodCategoriesRecordData({
  String? id,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoodCategoriesRecordDocumentEquality
    implements Equality<MoodCategoriesRecord> {
  const MoodCategoriesRecordDocumentEquality();

  @override
  bool equals(MoodCategoriesRecord? e1, MoodCategoriesRecord? e2) {
    return e1?.id == e2?.id && e1?.name == e2?.name;
  }

  @override
  int hash(MoodCategoriesRecord? e) =>
      const ListEquality().hash([e?.id, e?.name]);

  @override
  bool isValidKey(Object? o) => o is MoodCategoriesRecord;
}
