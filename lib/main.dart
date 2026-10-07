import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprintsapp/firebase_options.dart';
import 'package:sprintsapp/theme/app_theme.dart';
import 'package:sprintsapp/views/blocs/users_bloc/users_bloc.dart';
import 'package:sprintsapp/views/custom_widget_example.dart';
import 'package:sprintsapp/views/firebase_products/firebase_products_view.dart';
import 'package:sprintsapp/views/grid_view_example.dart';
import 'package:sprintsapp/views/list_view_example.dart';
import 'package:sprintsapp/views/login_view.dart';
import 'package:sprintsapp/views/users_list_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sprints Demo',
      theme: Theme.of(context).brightness == Brightness.dark
          ? AppTheme.darkMediumContrast
          : AppTheme.lightTheme,
      //   ThemeData(
      //   colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      //   fontFamily: 'oswald',
      // ),
      home: FirebaseProductsView(),
      // home: LoginScreen(),
      // home: ListViewExample(),
      // home: GridViewExample(),
      // home: CustomeWidgetsView(),
      // home: BlocProvider(
      //   create: (context) => UsersBloc()..add(GetUsersData()),
      //   child: UsersListView(),
      // ),
    );
  }
}
