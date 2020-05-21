part of provider_setup;

List<SingleChildWidget> dependentProvider = [
  ProxyProvider<TokenExpiredHandler, HttpHandler>(
    update: (_, tokenExpiredHandler, __) => HttpHandler(tokenExpiredHandler),
  ),

  /**
   * Api Service
   */
  ProxyProvider2<SharedPreferencesManager, HttpHandler, AuthApiService>(
    update: (_, prefs, httpHandler, __) =>
        RestApiFactory(prefs, httpHandler).provideAuthApi(),
  ),
  ProxyProvider2<SharedPreferencesManager, HttpHandler, QuestionApiService>(
    update: (_, prefs, httpHandler, __) =>
        RestApiFactory(prefs, httpHandler).provideQuestionApi(),
  ),

  /**
   * Repositories
   */
  ProxyProvider2<QuestionApiService, SharedPreferencesManager,
      QuestionRepositoryImpl>(
    update: (_, questionApiService, prefs, __) =>
        QuestionRepositoryImpl(questionApiService, prefs),
  ),

  /**
   * UseCases
   */
  ProxyProvider<QuestionRepositoryImpl, QuestionUseCase>(
    update: (_, questionRepository, __) => QuestionUseCase(questionRepository),
  ),
];
