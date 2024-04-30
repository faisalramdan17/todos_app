import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

typedef IgnoredErrorCondition = bool Function(Exception error);

IgnoredErrorCondition errorIs<T extends Exception>() => (Exception error) => error is T;

class ErrorMessageListener<B extends StateStreamableSource<S>, S> extends StatefulWidget {
  const ErrorMessageListener({
    super.key,
    required this.listenWhen,
    required this.mapStateToError,
    this.ignoredErrors = const <IgnoredErrorCondition>[],
    this.localizeError,
    required this.child,
  });

  final bool Function(S state) listenWhen;
  final Exception? Function(S state) mapStateToError;
  final List<IgnoredErrorCondition> ignoredErrors;

  /// {@macro ui.widgets.ErrorToastDispatcherState.localizeError}
  final String? Function(Exception error)? localizeError;
  final Widget child;

  @override
  State<ErrorMessageListener<B, S>> createState() => _ErrorMessageListenerState<B, S>();
}

class _ErrorMessageListenerState<B extends StateStreamableSource<S>, S> extends State<ErrorMessageListener<B, S>> {
  @override
  Widget build(BuildContext context) => widget.child;

  @override
  @override
  void initState() {
    super.initState();
    _initialError = mapStateToError(context.read<B>().state);
    _subscribeBloc();
  }

  @override
  void dispose() {
    _unsubscribeBloc();
    super.dispose();
  }

  bool listenWhen(S state) => widget.listenWhen(state);

  Exception? mapStateToError(S state) => widget.mapStateToError(state);

  late final Exception? _initialError;
  StreamSubscription? _blocSubscription;
  void _subscribeBloc() {
    _blocSubscription = context
        .read<B>()
        .stream
        .map(mapStateToError)
        .where((Exception? error) => error != _initialError)
        .where((Exception? error) => error != null)
        .distinct()
        .listen(_errorListener);
  }

  void _unsubscribeBloc() {
    _blocSubscription?.cancel();
    _blocSubscription = null;
  }

  List<IgnoredErrorCondition> get ignoredErrors => [
        ...widget.ignoredErrors,
      ];
  bool _isIgnored(Exception error) => ignoredErrors.any((IgnoredErrorCondition condition) => condition(error));

  void _errorListener(Exception? error) {
    if (error == null || _isIgnored(error) || listenWhen(context.read<B>().state)) return;

    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'On Snap!',
        message: localizeError(error) ?? error.toString(),

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  /// Override this method to localize error messages
  ///
  /// {@template ui.widgets.ErrorToastDispatcherState.localizeError}
  /// Return `null` to use [Object.toString] as error message.
  /// Defaults to `null`.
  /// {@endtemplate}
  String? localizeError(Exception error) => widget.localizeError?.call(error);
}
