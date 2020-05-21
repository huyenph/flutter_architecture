import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterarchitecture/blocs/simple_bloc_delegate.dart';
import 'package:flutterarchitecture/core/utils.dart';
import 'package:flutterarchitecture/di/provider_setup.dart';
import 'package:flutterarchitecture/core/app_config.dart';
import 'package:flutterarchitecture/main_app.dart';
import 'package:provider/provider.dart';

void main() {
  AppConfig(flavor: Flavor.DEV);
  Provider.debugCheckInvalidValueType = null;
  BlocSupervisor.delegate = SimpleBlocDelegate();
  appLogging();
  runApp(
    MultiProvider(
      providers: providers,
      child: MainApp(),
    ),
  );
}
