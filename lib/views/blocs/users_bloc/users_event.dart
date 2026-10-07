part of 'users_bloc.dart';

@immutable
sealed class UsersEvent {}

class GetUsersData extends UsersEvent {}

class GetUserById extends UsersEvent {
  int id;
  GetUserById(this.id);
}
