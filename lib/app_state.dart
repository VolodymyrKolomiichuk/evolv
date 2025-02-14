import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _selectedMoodCategories = LoggableList(
        prefs.getStringList('ff_selectedMoodCategories') ??
            _selectedMoodCategories,
      );
    });
    _safeInit(() {
      _selectedAdviceCategories = LoggableList(
        prefs.getStringList('ff_selectedAdviceCategories') ??
            _selectedAdviceCategories,
      );
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _sliderValue = 0;
  int get sliderValue => _sliderValue;
  set sliderValue(int value) {
    _sliderValue = value;

    debugLogAppState(this);
  }

  bool _adviceLikeStatus = false;
  bool get adviceLikeStatus => _adviceLikeStatus;
  set adviceLikeStatus(bool value) {
    _adviceLikeStatus = value;

    debugLogAppState(this);
  }

  bool _adviceDislikeStatus = false;
  bool get adviceDislikeStatus => _adviceDislikeStatus;
  set adviceDislikeStatus(bool value) {
    _adviceDislikeStatus = value;

    debugLogAppState(this);
  }

  String _moodNote = '';
  String get moodNote => _moodNote;
  set moodNote(String value) {
    _moodNote = value;

    debugLogAppState(this);
  }

  late LoggableList<String> _selectedMoodCategories = LoggableList([]);
  List<String> get selectedMoodCategories =>
      _selectedMoodCategories?..logger = () => debugLogAppState(this);
  set selectedMoodCategories(List<String> value) {
    if (value != null) {
      _selectedMoodCategories = LoggableList(value);
    }

    prefs.setStringList('ff_selectedMoodCategories', value);
    debugLogAppState(this);
  }

  void addToSelectedMoodCategories(String value) {
    selectedMoodCategories.add(value);
    prefs.setStringList('ff_selectedMoodCategories', _selectedMoodCategories);
  }

  void removeFromSelectedMoodCategories(String value) {
    selectedMoodCategories.remove(value);
    prefs.setStringList('ff_selectedMoodCategories', _selectedMoodCategories);
  }

  void removeAtIndexFromSelectedMoodCategories(int index) {
    selectedMoodCategories.removeAt(index);
    prefs.setStringList('ff_selectedMoodCategories', _selectedMoodCategories);
  }

  void updateSelectedMoodCategoriesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedMoodCategories[index] = updateFn(_selectedMoodCategories[index]);
    prefs.setStringList('ff_selectedMoodCategories', _selectedMoodCategories);
  }

  void insertAtIndexInSelectedMoodCategories(int index, String value) {
    selectedMoodCategories.insert(index, value);
    prefs.setStringList('ff_selectedMoodCategories', _selectedMoodCategories);
  }

  late LoggableList<String> _selectedAdviceCategories = LoggableList([]);
  List<String> get selectedAdviceCategories =>
      _selectedAdviceCategories?..logger = () => debugLogAppState(this);
  set selectedAdviceCategories(List<String> value) {
    if (value != null) {
      _selectedAdviceCategories = LoggableList(value);
    }

    prefs.setStringList('ff_selectedAdviceCategories', value);
    debugLogAppState(this);
  }

  void addToSelectedAdviceCategories(String value) {
    selectedAdviceCategories.add(value);
    prefs.setStringList(
        'ff_selectedAdviceCategories', _selectedAdviceCategories);
  }

  void removeFromSelectedAdviceCategories(String value) {
    selectedAdviceCategories.remove(value);
    prefs.setStringList(
        'ff_selectedAdviceCategories', _selectedAdviceCategories);
  }

  void removeAtIndexFromSelectedAdviceCategories(int index) {
    selectedAdviceCategories.removeAt(index);
    prefs.setStringList(
        'ff_selectedAdviceCategories', _selectedAdviceCategories);
  }

  void updateSelectedAdviceCategoriesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedAdviceCategories[index] =
        updateFn(_selectedAdviceCategories[index]);
    prefs.setStringList(
        'ff_selectedAdviceCategories', _selectedAdviceCategories);
  }

  void insertAtIndexInSelectedAdviceCategories(int index, String value) {
    selectedAdviceCategories.insert(index, value);
    prefs.setStringList(
        'ff_selectedAdviceCategories', _selectedAdviceCategories);
  }

  Map<String, DebugDataField> toDebugSerializableMap() => {
        'sliderValue': debugSerializeParam(
          sliderValue,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/evolve-gtuwjo?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ch8KFwoLc2xpZGVyVmFsdWUSCGRnNWk0NndicgIIAXoAWgtzbGlkZXJWYWx1ZQ==',
          name: 'int',
          nullable: false,
        ),
        'adviceLikeStatus': debugSerializeParam(
          adviceLikeStatus,
          ParamType.bool,
          link:
              'https://app.flutterflow.io/project/evolve-gtuwjo?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CiQKHAoQYWR2aWNlTGlrZVN0YXR1cxIIZnFlb3Z1cGxyAggFegBaEGFkdmljZUxpa2VTdGF0dXM=',
          name: 'bool',
          nullable: false,
        ),
        'adviceDislikeStatus': debugSerializeParam(
          adviceDislikeStatus,
          ParamType.bool,
          link:
              'https://app.flutterflow.io/project/evolve-gtuwjo?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CicKHwoTYWR2aWNlRGlzbGlrZVN0YXR1cxIIOGUxMjIydjZyAggFegBaE2FkdmljZURpc2xpa2VTdGF0dXM=',
          name: 'bool',
          nullable: false,
        ),
        'moodNote': debugSerializeParam(
          moodNote,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/evolve-gtuwjo?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChwKFAoIbW9vZE5vdGUSCHpnZHF3dmFncgIIA3oAWghtb29kTm90ZQ==',
          name: 'String',
          nullable: false,
        ),
        'selectedMoodCategories': debugSerializeParam(
          selectedMoodCategories,
          ParamType.String,
          isList: true,
          link:
              'https://app.flutterflow.io/project/evolve-gtuwjo?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CiwKIgoWc2VsZWN0ZWRNb29kQ2F0ZWdvcmllcxIIa2wwMmN0d21yBBICCAN6AFoWc2VsZWN0ZWRNb29kQ2F0ZWdvcmllcw==',
          name: 'String',
          nullable: false,
        ),
        'selectedAdviceCategories': debugSerializeParam(
          selectedAdviceCategories,
          ParamType.String,
          isList: true,
          link:
              'https://app.flutterflow.io/project/evolve-gtuwjo?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ci4KJAoYc2VsZWN0ZWRBZHZpY2VDYXRlZ29yaWVzEgh2cmtmd3d6aHIEEgIIA3oAWhhzZWxlY3RlZEFkdmljZUNhdGVnb3JpZXM=',
          name: 'String',
          nullable: false,
        )
      };
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
