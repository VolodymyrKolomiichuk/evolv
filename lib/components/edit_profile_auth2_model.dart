import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'edit_profile_auth2_widget.dart' show EditProfileAuth2Widget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileAuth2Model extends FlutterFlowModel<EditProfileAuth2Widget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for DropDown widget.
  String? _dropDownValue;
  set dropDownValue(String? value) {
    _dropDownValue = value;
    debugLogWidgetClass(this);
  }

  String? get dropDownValue => _dropDownValue;

  FormFieldController<String>? dropDownValueController;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode;
  TextEditingController? myBioTextController;
  String? Function(BuildContext, String?)? myBioTextControllerValidator;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    myBioFocusNode?.dispose();
    myBioTextController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'title': debugSerializeParam(
            widget?.title,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=editProfile_auth_2',
            searchReference:
                'reference=SicKDwoFdGl0bGUSBnZzc2RyMSoOEgxFZGl0IFByb2ZpbGVyBAgDIAFQAFoFdGl0bGU=',
            name: 'String',
            nullable: false,
          ),
          'confirmButtonText': debugSerializeParam(
            widget?.confirmButtonText,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=editProfile_auth_2',
            searchReference:
                'reference=SjMKGwoRY29uZmlybUJ1dHRvblRleHQSBnhld2ducyoOEgxTYXZlIENoYW5nZXNyBAgDIAFQAFoRY29uZmlybUJ1dHRvblRleHQ=',
            name: 'String',
            nullable: false,
          ),
          'navigateAction': debugSerializeParam(
            widget?.navigateAction,
            ParamType.Action,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=editProfile_auth_2',
            searchReference:
                'reference=SiAKGAoObmF2aWdhdGVBY3Rpb24SBnhyY25hOHIECBUgAVAAWg5uYXZpZ2F0ZUFjdGlvbg==',
            name: 'Future Function()',
            nullable: true,
          )
        }.withoutNulls,
        widgetStates: {
          'yourNameText': debugSerializeParam(
            yourNameTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=editProfile_auth_2',
            name: 'String',
            nullable: true,
          ),
          'dropDownValue': debugSerializeParam(
            dropDownValue,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=editProfile_auth_2',
            name: 'String',
            nullable: true,
          ),
          'myBioText': debugSerializeParam(
            myBioTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=editProfile_auth_2',
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
            'https://app.flutterflow.io/project/evolve-gtuwjo/tab=uiBuilder&page=editProfile_auth_2',
        searchReference:
            'reference=OhJlZGl0UHJvZmlsZV9hdXRoXzJQAFoSZWRpdFByb2ZpbGVfYXV0aF8y',
        widgetClassName: 'editProfile_auth_2',
      );
}
