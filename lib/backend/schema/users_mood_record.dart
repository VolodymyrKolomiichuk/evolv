import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersMoodRecord extends FirestoreRecord {
  UsersMoodRecord._(
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

  // "category_id" field.
  String? _categoryId;
  String get categoryId => _categoryId ?? '';
  bool hasCategoryId() => _categoryId != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "user_emoji" field.
  String? _userEmoji;
  String get userEmoji => _userEmoji ?? '';
  bool hasUserEmoji() => _userEmoji != null;

  // "user_text" field.
  String? _userText;
  String get userText => _userText ?? '';
  bool hasUserText() => _userText != null;

  // "selected_mood_categories" field.
  List<String>? _selectedMoodCategories;
  List<String> get selectedMoodCategories =>
      _selectedMoodCategories ?? const [];
  bool hasSelectedMoodCategories() => _selectedMoodCategories != null;

  // "days_emoji" field.
  int? _daysEmoji;
  int get daysEmoji => _daysEmoji ?? 0;
  bool hasDaysEmoji() => _daysEmoji != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _categoryId = snapshotData['category_id'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _text = snapshotData['text'] as String?;
    _imageUrl = snapshotData['image_url'] as String?;
    _userEmoji = snapshotData['user_emoji'] as String?;
    _userText = snapshotData['user_text'] as String?;
    _selectedMoodCategories =
        getDataList(snapshotData['selected_mood_categories']);
    _daysEmoji = castToType<int>(snapshotData['days_emoji']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users_mood');

  static Stream<UsersMoodRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersMoodRecord.fromSnapshot(s));

  static Future<UsersMoodRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersMoodRecord.fromSnapshot(s));

  static UsersMoodRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersMoodRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersMoodRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersMoodRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersMoodRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersMoodRecord &&
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
        'category_id': debugSerializeParam(
          categoryId,
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
        ),
        'user_emoji': debugSerializeParam(
          userEmoji,
          ParamType.String,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'String',
          nullable: false,
        ),
        'user_text': debugSerializeParam(
          userText,
          ParamType.String,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'String',
          nullable: false,
        ),
        'selected_mood_categories': debugSerializeParam(
          selectedMoodCategories,
          ParamType.String,
          isList: true,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'String',
          nullable: false,
        ),
        'days_emoji': debugSerializeParam(
          daysEmoji,
          ParamType.int,
          link: 'https://app.flutterflow.io/project/evolve-gtuwjo?tab=database',
          name: 'int',
          nullable: false,
        )
      };
}

Map<String, dynamic> createUsersMoodRecordData({
  String? id,
  String? userId,
  String? categoryId,
  DateTime? createdAt,
  String? text,
  String? imageUrl,
  String? userEmoji,
  String? userText,
  int? daysEmoji,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'user_id': userId,
      'category_id': categoryId,
      'created_at': createdAt,
      'text': text,
      'image_url': imageUrl,
      'user_emoji': userEmoji,
      'user_text': userText,
      'days_emoji': daysEmoji,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersMoodRecordDocumentEquality implements Equality<UsersMoodRecord> {
  const UsersMoodRecordDocumentEquality();

  @override
  bool equals(UsersMoodRecord? e1, UsersMoodRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.userId == e2?.userId &&
        e1?.categoryId == e2?.categoryId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.text == e2?.text &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.userEmoji == e2?.userEmoji &&
        e1?.userText == e2?.userText &&
        listEquality.equals(
            e1?.selectedMoodCategories, e2?.selectedMoodCategories) &&
        e1?.daysEmoji == e2?.daysEmoji;
  }

  @override
  int hash(UsersMoodRecord? e) => const ListEquality().hash([
        e?.id,
        e?.userId,
        e?.categoryId,
        e?.createdAt,
        e?.text,
        e?.imageUrl,
        e?.userEmoji,
        e?.userText,
        e?.selectedMoodCategories,
        e?.daysEmoji
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersMoodRecord;
}
