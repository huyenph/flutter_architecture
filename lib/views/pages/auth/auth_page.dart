import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterarchitecture/constants/size_config.dart';
import 'package:flutterarchitecture/views/widgets/buttons.dart';

import '../../base/base_state.dart';
import 'package:flutterarchitecture/constants/app_colors.dart' as appColors;

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends BaseState<AuthPage> {
  @override
  Widget buildBody() {
    SizeConfig.instance.init(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [appColors.indigo_400, appColors.indigo_500],
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Center(
              child: Image.asset(
                'assets/images/ic-stack-exchange-150.png',
                height: SizeConfig.instance.safeBlockVertical * 300,
                width: SizeConfig.instance.safeBlockHorizontal * 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MFlatButton(
                      onPressed: () {},
                      label: 'Sign up',
                      textColor: appColors.indigo_800,
                    ),
                    SizedBox(width: 10.0),
                    MFlatButton(
                      onPressed: () {},
                      label: 'Log in',
                      textColor: appColors.indigo_800,
                    ),
                  ],
                ),
                Text(
                  'Start using without account',
                  style: TextStyle(
                    color: appColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
