import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprintsapp/data_source/user_remote_data_source.dart';
import 'package:sprintsapp/models/user_model.dart';
import 'package:sprintsapp/views/blocs/users_bloc/users_bloc.dart';

class UsersListView extends StatefulWidget {
  const UsersListView({super.key});

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  // @override
  // void initState() {
  //   super.initState();
  //   BlocProvider.of<UsersBloc>(context).add(GetUsersData());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<UsersBloc, UsersState>(
        listener: (context, state) {
          if (state is UsersError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
          }
          if (state is UsersSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));
          }
        },
        builder: (context, state) {
          if (state is UsersLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UsersSuccess) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(state.users[index].name ?? "--"),
                  subtitle: Text(state.users[index].email ?? "--"),
                  trailing: Icon(Icons.contact_mail),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
