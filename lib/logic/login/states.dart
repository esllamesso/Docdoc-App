class LoginsStates {}

class LoginsInitialState extends LoginsStates {}

class LoginsLoadingState extends LoginsStates {}

class LoginsSuccessState extends LoginsStates {}

class LoginsErrorState extends LoginsStates {
  final String errorMessage;

  LoginsErrorState(this.errorMessage);
}
