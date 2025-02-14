import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'create04_task_widget.dart' show Create04TaskWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Create04TaskModel extends FlutterFlowModel<Create04TaskWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for task widget.
  FocusNode? taskFocusNode;
  TextEditingController? taskTextController;
  String? Function(BuildContext, String?)? taskTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) {
    choiceChipsValueController?.value = val != null ? [val] : [];
    debugLogWidgetClass(this);
  }

  DateTime? datePicked;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    taskFocusNode?.dispose();
    taskTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetStates: {
          'taskText': debugSerializeParam(
            taskTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=Create04Task',
            name: 'String',
            nullable: true,
          ),
          'descriptionText': debugSerializeParam(
            descriptionTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=Create04Task',
            name: 'String',
            nullable: true,
          ),
          'choiceChipsValue': debugSerializeParam(
            choiceChipsValue,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=Create04Task',
            name: 'String',
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
            'https://app.flutterflow.io/project/evolve-gtuwjo/tab=uiBuilder&page=Create04Task',
        searchReference: 'reference=OgxDcmVhdGUwNFRhc2tQAVoMQ3JlYXRlMDRUYXNr',
        widgetClassName: 'Create04Task',
      );
}
