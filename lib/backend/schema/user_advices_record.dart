import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAdvicesRecord extends FirestoreRecord {
  UserAdvicesRecord._(
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

  // "advice_id" field.
  String? _adviceId;
  String get adviceId => _adviceId ?? '';
  bool hasAdviceId() => _adviceId != null;

  // "liked" field.
  bool? _liked;
  bool get liked => _liked ?? false;
  bool hasLiked() => _liked != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "advice_text" field.
  String? _adviceText;
  String get adviceText => _adviceText ?? '';
  bool hasAdviceText() => _adviceText != null;

  // "advice_image" field.
  String? _adviceImage;
  String get adviceImage => _adviceImage ?? '';
  bool hasAdviceImage() => _adviceImage != null;

  // "selected_advice_categories" field.
  List<String>? _selectedAdviceCategories;
  List<String> get selectedAdviceCategories =>
      _selectedAdviceCategories ?? const [];
  bool hasSelectedAdviceCategories() => _selectedAdviceCategories != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _adviceId = snapshotData['advice_id'] as String?;
    _liked = snapshotData['liked'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _adviceText = snapshotData['advice_text'] as String?;
    _adviceImage = snapshotData['advice_image'] as String?;
    _selectedAdviceCategories =
        getDataList(snapshotData['selected_advice_categories']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_advices');

  static Stream<UserAdvicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserAdvicesRecord.fromSnapshot(s));

  static Future<UserAdvicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserAdvicesRecord.fromSnapshot(s));

  static UserAdvicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserAdvicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserAdvicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserAdvicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserAdvicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserAdvicesRecord &&
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
        'advice_id': debugSerializeParam(
          adviceId,
          ParamType.String,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'String',
          nullable: false,
        ),
        'liked': debugSerializeParam(
          liked,
          ParamType.bool,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'bool',
          nullable: false,
        ),
        'created_at': debugSerializeParam(
          createdAt,
          ParamType.DateTime,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'DateTime',
          nullable: true,
        ),
        'advice_text': debugSerializeParam(
          adviceText,
          ParamType.String,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'String',
          nullable: false,
        ),
        'advice_image': debugSerializeParam(
          adviceImage,
          ParamType.String,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'String',
          nullable: false,
        ),
        'selected_advice_categories': debugSerializeParam(
          selectedAdviceCategories,
          ParamType.String,
          isList: true,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'String',
          nullable: false,
        )
      };
}

Map<String, dynamic> createUserAdvicesRecordData({
  String? id,
  String? userId,
  String? adviceId,
  bool? liked,
  DateTime? createdAt,
  String? adviceText,
  String? adviceImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'user_id': userId,
      'advice_id': adviceId,
      'liked': liked,
      'created_at': createdAt,
      'advice_text': adviceText,
      'advice_image': adviceImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserAdvicesRecordDocumentEquality implements Equality<UserAdvicesRecord> {
  const UserAdvicesRecordDocumentEquality();

  @override
  bool equals(UserAdvicesRecord? e1, UserAdvicesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.userId == e2?.userId &&
        e1?.adviceId == e2?.adviceId &&
        e1?.liked == e2?.liked &&
        e1?.createdAt == e2?.createdAt &&
        e1?.adviceText == e2?.adviceText &&
        e1?.adviceImage == e2?.adviceImage &&
        listEquality.equals(
            e1?.selectedAdviceCategories, e2?.selectedAdviceCategories);
  }

  @override
  int hash(UserAdvicesRecord? e) => const ListEquality().hash([
        e?.id,
        e?.userId,
        e?.adviceId,
        e?.liked,
        e?.createdAt,
        e?.adviceText,
        e?.adviceImage,
        e?.selectedAdviceCategories
      ]);

  @override
  bool isValidKey(Object? o) => o is UserAdvicesRecord;
}
