import '/backend/api_requests/api_calls.dart';
import '/chat_g_p_t_component/empty_list/empty_list_widget.dart';
import '/chat_g_p_t_component/writing_indicator/writing_indicator_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'ai_chat_component_widget.dart' show AiChatComponentWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AiChatComponentModel extends FlutterFlowModel<AiChatComponentWidget> {
  ///  Local state fields for this component.

  dynamic _chatHistory;
  set chatHistory(dynamic value) {
    _chatHistory = value;
    debugLogWidgetClass(this);
  }

  dynamic get chatHistory => _chatHistory;

  bool _aiResponding = false;
  set aiResponding(bool value) {
    _aiResponding = value;
    debugLogWidgetClass(this);
  }

  bool get aiResponding => _aiResponding;

  String _inputContent = '';
  set inputContent(String value) {
    _inputContent = value;
    debugLogWidgetClass(this);
  }

  String get inputContent => _inputContent;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Model for writingIndicator component.
  late WritingIndicatorModel writingIndicatorModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Send Full Prompt)] action in IconButton widget.
  ApiCallResponse? _chatGPTResponse;
  set chatGPTResponse(ApiCallResponse? value) {
    _chatGPTResponse = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get chatGPTResponse => _chatGPTResponse;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
    writingIndicatorModel = createModel(context, () => WritingIndicatorModel());
  }

  @override
  void dispose() {
    listViewController?.dispose();
    writingIndicatorModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'chatHistory': debugSerializeParam(
            chatHistory,
            ParamType.JSON,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=aiChat_Component',
            searchReference:
                'reference=QhoKFAoLY2hhdEhpc3RvcnkSBXgwdDQwcgIICVAAWgtjaGF0SGlzdG9yeWIQYWlDaGF0X0NvbXBvbmVudA==',
            name: 'dynamic',
            nullable: true,
          ),
          'aiResponding': debugSerializeParam(
            aiResponding,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=aiChat_Component',
            searchReference:
                'reference=Qh8KFQoMYWlSZXNwb25kaW5nEgV6MXNzMioAcgQIBSABUABaDGFpUmVzcG9uZGluZ2IQYWlDaGF0X0NvbXBvbmVudA==',
            name: 'bool',
            nullable: false,
          ),
          'inputContent': debugSerializeParam(
            inputContent,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=aiChat_Component',
            searchReference:
                'reference=Qh8KFQoMaW5wdXRDb250ZW50EgVoN2ZkdSoAcgQIAyABUABaDGlucHV0Q29udGVudGIQYWlDaGF0X0NvbXBvbmVudA==',
            name: 'String',
            nullable: false,
          )
        },
        widgetStates: {
          'textFieldText': debugSerializeParam(
            textController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=aiChat_Component',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'chatGPTResponse': debugSerializeParam(
            chatGPTResponse,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=aiChat_Component',
            name: 'ApiCallResponse',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'writingIndicatorModel (writingIndicator)':
              writingIndicatorModel?.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/evolve-gtuwjo/tab=uiBuilder&page=aiChat_Component',
        searchReference:
            'reference=OhBhaUNoYXRfQ29tcG9uZW50UABaEGFpQ2hhdF9Db21wb25lbnQ=',
        widgetClassName: 'aiChat_Component',
      );
}
