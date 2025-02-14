import '/chat_g_p_t_component/ai_chat_component/ai_chat_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'chat_ai_screen_widget.dart' show ChatAiScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatAiScreenModel extends FlutterFlowModel<ChatAiScreenWidget> {
  ///  Local state fields for this page.

  String? _inputContent = '';
  set inputContent(String? value) {
    _inputContent = value;
    debugLogWidgetClass(this);
  }

  String? get inputContent => _inputContent;

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

  ///  State fields for stateful widgets in this page.

  // Model for aiChat_Component component.
  late AiChatComponentModel aiChatComponentModel;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    aiChatComponentModel = createModel(context, () => AiChatComponentModel());

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    aiChatComponentModel.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'inputContent': debugSerializeParam(
            inputContent,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=chat_ai_Screen',
            searchReference:
                'reference=Qh8KFQoMaW5wdXRDb250ZW50EgV5ajA2YSoAcgQIAyAAUAFaDGlucHV0Q29udGVudGIOY2hhdF9haV9TY3JlZW4=',
            name: 'String',
            nullable: true,
          ),
          'chatHistory': debugSerializeParam(
            chatHistory,
            ParamType.JSON,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=chat_ai_Screen',
            searchReference:
                'reference=QhoKFAoLY2hhdEhpc3RvcnkSBWMzeXJocgIICVABWgtjaGF0SGlzdG9yeWIOY2hhdF9haV9TY3JlZW4=',
            name: 'dynamic',
            nullable: true,
          ),
          'aiResponding': debugSerializeParam(
            aiResponding,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=chat_ai_Screen',
            searchReference:
                'reference=Qh8KFQoMYWlSZXNwb25kaW5nEgVsNjNteSoAcgQIBSABUAFaDGFpUmVzcG9uZGluZ2IOY2hhdF9haV9TY3JlZW4=',
            name: 'bool',
            nullable: false,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'aiChatComponentModel (aiChat_Component)':
              aiChatComponentModel?.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/evolve-gtuwjo/tab=uiBuilder&page=chat_ai_Screen',
        searchReference:
            'reference=Og5jaGF0X2FpX1NjcmVlblABWg5jaGF0X2FpX1NjcmVlbg==',
        widgetClassName: 'chat_ai_Screen',
      );
}
