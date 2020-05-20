import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterarchitecture/blocs/simple_bloc_delegate.dart';
import 'package:flutterarchitecture/core/utils.dart';
import 'file:///D:/Mobile/UtilDev/flutter_architecture/lib/core/app_config.dart';
import 'package:flutterarchitecture/main_app.dart';
import 'package:provider/provider.dart';

void main() {
  AppConfig(flavor: Flavor.DEV);
  Provider.debugCheckInvalidValueType = null;
  BlocSupervisor.delegate = SimpleBlocDelegate();
  appLogging();
  runApp(MainApp());
}


