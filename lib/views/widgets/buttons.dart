import 'package:flutter/material.dart';
import 'package:flutterarchitecture/constants/app_colors.dart' as appColors;
import 'package:flutterarchitecture/constants/size_config.dart';

class MRaisedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color splashColor;
  final Color textColor;
  final EdgeInsets padding;
  final String label;
  final int textSize;
  final double width;
  final double height;
  final double radius;

  MRaisedButton({
    @required this.onPressed,
    @required this.label,
    this.backgroundColor,
    this.splashColor,
    this.textColor,
    this.padding,
    this.textSize,
    this.width,
    this.height,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: backgroundColor ?? appColors.white,
      splashColor: splashColor,
      padding: padding ??
          EdgeInsets.all(SizeConfig.instance.safeBlockHorizontal * 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            radius ?? SizeConfig.instance.safeBlockHorizontal * 1,
          ),
        ),
      ),
      child: Container(
        width: width ?? SizeConfig.instance.safeBlockHorizontal * 30,
        alignment: AlignmentDirectional.center,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: textColor ?? appColors.white,
            fontSize: textSize ?? SizeConfig.instance.safeBlockHorizontal * 5,
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class MFlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color splashColor;
  final Color textColor;
  final EdgeInsets padding;
  final String label;
  final int textSize;
  final double width;
  final double height;
  final double radius;

  MFlatButton({
    @required this.onPressed,
    @required this.label,
    this.backgroundColor,
    this.splashColor,
    this.textColor,
    this.padding,
    this.textSize,
    this.width,
    this.height,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: backgroundColor ?? appColors.white,
      splashColor: splashColor,
      padding: padding ??
          EdgeInsets.all(SizeConfig.instance.safeBlockHorizontal * 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            radius ?? SizeConfig.instance.safeBlockHorizontal * 1,
          ),
        ),
      ),
      child: Container(
        width: width ?? SizeConfig.instance.safeBlockHorizontal * 30,
        alignment: AlignmentDirectional.center,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: textColor ?? appColors.white,
            fontSize: textSize ?? SizeConfig.instance.safeBlockHorizontal * 5,
          ),
        ),  
      ),
      onPressed: onPressed,
    );
  }
}
