part of provider_setup;

List<SingleChildWidget> independentProvider = [
  Provider.value(value: TokenExpiredHandler()),
  Provider.value(value: SharedPreferencesManager()),
];
