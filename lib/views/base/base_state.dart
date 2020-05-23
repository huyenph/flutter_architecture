import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterarchitecture/data/remote/token_expired_handler.dart';
import 'package:flutterarchitecture/views/base/base_state_listener.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    implements BaseStateListener, TokenExpiredListener {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FocusNode focusNode = FocusNode();

  bool _isLoading = false;
  bool _isDialogShowing = false;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress) {
          return Platform.isIOS;
        } else
          return true;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: buildAppBar(),
        drawer: buildDrawer(),
        bottomNavigationBar: buildBottomNavigation(),
        floatingActionButton: buildFloatingButton(),
        body: buildBody(),
      ),
    );
  }

  @override
  void onShowLoading(String text) async {
    return null;
//    if (!_isLoading) {
//      _isLoading = true;
//      await showDialog(
//        context: context,
//        barrierDismissible: false,
//        builder: (BuildContext context) {
//          return AlertDialog(
//            content: Row(
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                CircularProgressIndicator(
//                  valueColor:
//                  AlwaysStoppedAnimation<Color>(appColors.primaryColor),
//                ),
//                SizedBox(width: 30.0),
//                Text(
//                  appStrings.PLEASE_WAIT,
//                  style: TextStyle(
//                    color: appColors.mainTextColor,
//                    fontWeight: FontWeight.w600,
//                  ),
//                ),
//              ],
//            ),
//          );
//        },
//      );
//    }
  }

  @override
  void onDismissLoading() {
    dismissLoading();
  }

  @override
  void onDisplayError(exception) {
//    showError(exception);
  }

  @override
  void onDisplayErrorWithTryAgain(exception, onTryAgain) {
    // TODO: implement onDisplayErrorWithTryAgain
  }

  @override
  BuildContext get viewContext => context;

  @override
  bool get isMounted => mounted;

  @override
  void onTokenExpired(TokenType type) {
    tokenExpired(type);
  }

//  GlobalKey<ScaffoldState> scaffoldKey();

  Widget buildAppBar() => null;

  Widget buildDrawer() => null;

  Widget buildBottomNavigation() => null;

  Widget buildFloatingButton() => null;

  Widget buildBody();

//  void showInformDialog(
//      String title,
//      String message,
//      String btnTitle,
//      VoidCallback onPressed, {
//        bool barrierDismissible: false,
//      }) async {
//    dismissDialog();
//    dismissLoading();
//    await showDialog(
//      context: context,
//      barrierDismissible: barrierDismissible,
//      builder: (BuildContext context) {
//        return AlertDialog(
//          title: title != null
//              ? Text(
//            title,
//            style: TextStyle(
//              color: appColors.mainTextColor,
//              fontWeight: FontWeight.w500,
//            ),
//          )
//              : null,
//          content: Text(
//            message,
//            style: TextStyle(
//              color: appColors.mainTextColor,
//              fontWeight: FontWeight.w400,
//            ),
//          ),
//          actions: <Widget>[
//            FlatButton(
//              onPressed: onPressed,
//              child: Text(
//                btnTitle,
//                style: TextStyle(
//                  color: appColors.primaryColor,
//                  fontWeight: FontWeight.w800,
//                ),
//              ),
//            ),
//          ],
//        );
//      },
//    );
//  }

//  void showError(
//      exception, {
//        String title,
//        String message,
//        String btnTitle,
//        VoidCallback onPressed,
//      }) {
//    if (exception is TokenExpiredException) {
//      dismissLoading();
//      dismissDialog();
//    } else {
//      showInformDialog(
//        title,
//        _getErrorMsg(exception),
//        btnTitle,
//            () => Navigator.of(context, rootNavigator: true).pop(),
//      );
//    }
//  }

  void dismissDialog() {
    if (_isDialogShowing) {
      _isDialogShowing = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  void dismissLoading() {
    if (_isLoading) {
      _isLoading = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  String _getErrorMsg(exception, {String unknownError}) {
//    String msg;
//    if (exception is SocketException || exception is TimeoutException) {
//      msg = appStrings.SERVER_ERROR;
//    } else if (exception is ConnectionException) {
//      msg = exception.message;
//    } else if (exception is ManuallyException) {
//      msg = exception.message;
//    } else if (exception is HandledHttpException) {
//      msg = appStrings.SERVER_ERROR;
//    } else if (exception is Error) {
//      msg = appStrings.UNKNOWN_ERROR;
//    }
//    return msg ?? unknownError ?? appStrings.UNKNOWN_ERROR;
    return '';
  }

  void tokenExpired(TokenType type) async {
//    _authApiService.signOut().then((_) async {
//      showInformDialog(
//          null,
//          type == ExpiredType.TOKEN_EXPIRED
//              ? appStrings.MSG_TOKEN_EXPIRED
//              : appStrings.MSG_ACCOUNT_SIGNED_IN_ANOTHER_DEVICE,
//          appStrings.OK,
//              () => Navigator.pushNamedAndRemoveUntil(
//              context, appStrings.SIGN_IN_ROUTE, (_) => false));
//    });
    clearMemory();
  }

  void clearMemory() {}
}
