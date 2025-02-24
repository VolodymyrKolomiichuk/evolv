import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

const debugRouteLinkMap = {
  '/splash':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=Splash',
  '/onboarding3':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=onboarding_3',
  '/onboarding1':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=onboarding_1',
  '/onboarding2':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=onboarding_2',
  '/authCreate':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=auth_Create',
  '/authLogin':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=auth_Login',
  '/authForgotPassword':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=auth_ForgotPassword',
  '/authLogin1':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=auth_Login_1',
  '/dashboard5':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=Dashboard5',
  '/quizMood':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=quiz_mood',
  '/details25QuizPage':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=Details25QuizPage',
  '/home':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=Home',
  '/home18Travel':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=Home18Travel',
  '/success03':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=Success03',
  '/quizMood3':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=quiz_mood_3',
  '/create04Task':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=Create04Task',
  '/quizMood2':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=quiz_mood_2',
  '/adviceCategories':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=advice_categories',
  '/success03Copy':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=Success03Copy',
  '/success':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=Success',
  '/chatAiScreen':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=chat_ai_Screen',
  '/authWelcomeScreen':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=auth_WelcomeScreen',
  '/adviceDetails':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=advice_details',
  '/quizMood3Copy':
      'https://app.flutterflow.io/project/evolve-gtuwjo?tab=uiBuilder&page=quiz_mood_3Copy'
};

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomeWidget() : AuthWelcomeScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? HomeWidget()
              : AuthWelcomeScreenWidget(),
        ),
        FFRoute(
          name: 'Splash',
          path: '/splash',
          builder: (context, params) => SplashWidget(),
        ),
        FFRoute(
          name: 'onboarding_3',
          path: '/onboarding3',
          builder: (context, params) => Onboarding3Widget(),
        ),
        FFRoute(
          name: 'onboarding_1',
          path: '/onboarding1',
          builder: (context, params) => Onboarding1Widget(),
        ),
        FFRoute(
          name: 'onboarding_2',
          path: '/onboarding2',
          builder: (context, params) => Onboarding2Widget(),
        ),
        FFRoute(
          name: 'auth_Create',
          path: '/authCreate',
          builder: (context, params) => AuthCreateWidget(),
        ),
        FFRoute(
          name: 'auth_Login',
          path: '/authLogin',
          builder: (context, params) => AuthLoginWidget(),
        ),
        FFRoute(
          name: 'auth_ForgotPassword',
          path: '/authForgotPassword',
          builder: (context, params) => AuthForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'auth_Login_1',
          path: '/authLogin1',
          builder: (context, params) => AuthLogin1Widget(),
        ),
        FFRoute(
          name: 'Dashboard5',
          path: '/dashboard5',
          builder: (context, params) => Dashboard5Widget(),
        ),
        FFRoute(
          name: 'quiz_mood',
          path: '/quizMood',
          builder: (context, params) => QuizMoodWidget(),
        ),
        FFRoute(
          name: 'Details25QuizPage',
          path: '/details25QuizPage',
          builder: (context, params) => Details25QuizPageWidget(),
        ),
        FFRoute(
          name: 'Home',
          path: '/home',
          requireAuth: true,
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: 'Home18Travel',
          path: '/home18Travel',
          builder: (context, params) => Home18TravelWidget(),
        ),
        FFRoute(
          name: 'Success03',
          path: '/success03',
          builder: (context, params) => Success03Widget(),
        ),
        FFRoute(
          name: 'quiz_mood_3',
          path: '/quizMood3',
          builder: (context, params) => QuizMood3Widget(),
        ),
        FFRoute(
          name: 'Create04Task',
          path: '/create04Task',
          builder: (context, params) => Create04TaskWidget(),
        ),
        FFRoute(
          name: 'quiz_mood_2',
          path: '/quizMood2',
          builder: (context, params) => QuizMood2Widget(),
        ),
        FFRoute(
          name: 'advice_categories',
          path: '/adviceCategories',
          builder: (context, params) => AdviceCategoriesWidget(),
        ),
        FFRoute(
          name: 'Success03Copy',
          path: '/success03Copy',
          builder: (context, params) => Success03CopyWidget(),
        ),
        FFRoute(
          name: 'Success',
          path: '/success',
          builder: (context, params) => SuccessWidget(),
        ),
        FFRoute(
          name: 'chat_ai_Screen',
          path: '/chatAiScreen',
          builder: (context, params) => ChatAiScreenWidget(),
        ),
        FFRoute(
          name: 'auth_WelcomeScreen',
          path: '/authWelcomeScreen',
          builder: (context, params) => AuthWelcomeScreenWidget(),
        ),
        FFRoute(
          name: 'advice_details',
          path: '/adviceDetails',
          builder: (context, params) => AdviceDetailsWidget(),
        ),
        FFRoute(
          name: 'quiz_mood_3Copy',
          path: '/quizMood3Copy',
          builder: (context, params) => QuizMood3CopyWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/authWelcomeScreen';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).figmaOnPrimary,
                  child: Image.asset(
                    'assets/images/Splash_logo.gif',
                    fit: BoxFit.scaleDown,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
