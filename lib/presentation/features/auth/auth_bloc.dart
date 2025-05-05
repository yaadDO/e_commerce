import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await repository.login(event.email, event.password);
        emit(AuthAuthenticated(user));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}