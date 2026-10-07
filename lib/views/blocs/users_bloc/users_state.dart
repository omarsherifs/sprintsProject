part of 'users_bloc.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

final class UsersLoading extends UsersState {}

final class UsersSuccess extends UsersState {
  UsersSuccess(this.users);
  final List<UserModel> users;
}

final class UsersError extends UsersState {
  UsersError(this.errorMsg);
  final String errorMsg;
}
