import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprintsapp/data_source/user_remote_data_source.dart';
import 'package:sprintsapp/models/user_model.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<GetUsersData>((event, emit) async {
      emit(UsersLoading());
      try {
        List<UserModel> userData = await UserRemoteDataSource().getUserData();
        emit(UsersSuccess(userData));
      } catch (e) {
        emit(UsersError("Some went wrong, ${e.toString()}"));
      }
    });
  }
}
