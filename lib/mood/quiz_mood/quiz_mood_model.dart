import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'quiz_mood_widget.dart' show QuizMoodWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class QuizMoodModel extends FlutterFlowModel<QuizMoodWidget> {
  ///  Local state fields for this page.

  int? _moodScore;
  set moodScore(int? value) {
    _moodScore = value;
    debugLogWidgetClass(this);
  }

  int? get moodScore => _moodScore;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Slider widget.
  double? _sliderValue;
  set sliderValue(double? value) {
    _sliderValue = value;
    debugLogWidgetClass(this);
  }

  double? get sliderValue => _sliderValue;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'moodScore': debugSerializeParam(
            moodScore,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=quiz_mood',
            searchReference:
                'reference=QhgKEgoJbW9vZFNjb3JlEgVzMzRneXICCAFQAVoJbW9vZFNjb3JlYglxdWl6X21vb2Q=',
            name: 'int',
            nullable: true,
          )
        },
        widgetStates: {
          'sliderValue': debugSerializeParam(
            sliderValue,
            ParamType.double,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=quiz_mood',
            name: 'double',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/evolve-gtuwjo/tab=uiBuilder&page=quiz_mood',
        searchReference: 'reference=OglxdWl6X21vb2RQAVoJcXVpel9tb29k',
        widgetClassName: 'quiz_mood',
      );
}
