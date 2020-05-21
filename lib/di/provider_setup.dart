library provider_setup;

import 'package:flutterarchitecture/data/local/shared_preferences_manager.dart';
import 'package:flutterarchitecture/data/remote/auth/auth_api_service.dart';
import 'package:flutterarchitecture/data/remote/http_handler.dart';
import 'package:flutterarchitecture/data/remote/question/question_api_service.dart';
import 'package:flutterarchitecture/data/remote/rest_api_factory.dart';
import 'package:flutterarchitecture/data/remote/token_expired_handler.dart';
import 'package:flutterarchitecture/data/repositories/question_repository_impl.dart';
import 'package:flutterarchitecture/domain/usecases/question_usecase.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
part 'independent_provider.dart';
part 'dependent_provider.dart';
part 'ui_consumable_provider.dart';

List<SingleChildWidget> providers = [
  ...independentProvider,
  ...dependentProvider,
  ...uiConsumableProvider,
];