import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBlocIntro extends Bloc<AuthEvent, AuthState> {
  AuthBlocIntro(super.initialState) {
    on<RegisterUser>((event, emit) => emit(AuthState(status: "")));
    on<LoginUser>((event, emit) {
      if (event.password == "senha") {
        emit(Authenticated(username: event.username));
      } else {
        emit(AuthError(message: "erou!"));
      }
    });
    on<Logout>((event, emit) => emit(Unauthenticated()));
  }
}

abstract class AuthEvent {}

class LoginUser extends AuthEvent {
  String username;
  String password;

  LoginUser({required this.username, required this.password});
}

class RegisterUser extends AuthEvent {
  String username;
  String password;

  RegisterUser({required this.username, required this.password});
}

class Logout extends AuthEvent {
  String username;
  String password;

  Logout({required this.username, required this.password});
}

class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  String username;

  Authenticated({required this.username});
}

class AuthError extends AuthState {
  String message;

  AuthError({required this.message});
}
