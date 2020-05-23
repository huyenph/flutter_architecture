import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double _screenWidth;
  static double _screenHeight;
  static double _blockSizeHorizontal;
  static double _blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double _safeBlockHorizontal;
  static double _safeBlockVertical;

  SizeConfig._internal();

  static final SizeConfig _singleton = SizeConfig._internal();

  static SizeConfig get instance => _singleton;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    _safeBlockHorizontal = (_screenWidth - _safeAreaHorizontal) / 100;
    _safeBlockVertical = (_screenHeight - _safeAreaVertical) / 100;
  }

  double get blockSizeHorizontal => _blockSizeHorizontal;

  double get blockSizeVertical => _blockSizeVertical;

  double get safeBlockHorizontal => _safeBlockHorizontal;

  double get safeBlockVertical => _safeBlockVertical;
}
