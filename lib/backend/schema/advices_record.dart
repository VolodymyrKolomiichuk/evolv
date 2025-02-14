import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdvicesRecord extends FirestoreRecord {
  AdvicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "category_id" field.
  String? _categoryId;
  String get categoryId => _categoryId ?? '';
  bool hasCategoryId() => _categoryId != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _categoryId = snapshotData['category_id'] as String?;
    _text = snapshotData['text'] as String?;
    _imageUrl = snapshotData['image_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('advices');

  static Stream<AdvicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdvicesRecord.fromSnapshot(s));

  static Future<AdvicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdvicesRecord.fromSnapshot(s));

  static AdvicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdvicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdvicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdvicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdvicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdvicesRecord &&
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
        'category_id': debugSerializeParam(
          categoryId,
          ParamType.String,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'String',
          nullable: false,
        ),
        'text': debugSerializeParam(
          text,
          ParamType.String,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'String',
          nullable: false,
        ),
        'image_url': debugSerializeParam(
          imageUrl,
          ParamType.String,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'String',
          nullable: false,
        )
      };
}

Map<String, dynamic> createAdvicesRecordData({
  String? id,
  String? categoryId,
  String? text,
  String? imageUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'category_id': categoryId,
      'text': text,
      'image_url': imageUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdvicesRecordDocumentEquality implements Equality<AdvicesRecord> {
  const AdvicesRecordDocumentEquality();

  @override
  bool equals(AdvicesRecord? e1, AdvicesRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.categoryId == e2?.categoryId &&
        e1?.text == e2?.text &&
        e1?.imageUrl == e2?.imageUrl;
  }

  @override
  int hash(AdvicesRecord? e) =>
      const ListEquality().hash([e?.id, e?.categoryId, e?.text, e?.imageUrl]);

  @override
  bool isValidKey(Object? o) => o is AdvicesRecord;
}
