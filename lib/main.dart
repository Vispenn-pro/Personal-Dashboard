import 'package:personal_dashboard/dashboard/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'state/app_state.dart';
import 'login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Personal Dashboard',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const Homepage(title: 'Personal Dashboard - Flutter PWA'),
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    Widget page;

    switch (appState.selectedIndex){
      case 0:
        page = const LoginForm();
        break;
      case 1:
        page = const Dashboard();
        break;
      default:
        throw UnimplementedError('No widget for ${appState.selectedIndex}');
    }

    return LayoutBuilder(
      builder: (context, constraints){
        return Theme(
          data: ThemeData.dark(),
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: page,
          ),
        );
      }
    );
  }
}
