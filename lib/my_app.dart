import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/auth_service.dart';
import 'screens/auth_screen.dart';
import 'screens/director/director_home.dart';
import 'screens/trainer/trainer_home.dart';
import 'screens/admin/admin_home.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _userRole;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    final authService = context.read<AuthService>();
    final role = await authService.getCurrentRole();
    setState(() {
      _userRole = role;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    Widget home;

    switch (_userRole) {
      case 'director':
        home = DirectorHomeScreen();
        break;
      case 'trainer':
        home = TrainerHomeScreen();
        break;
      case 'admin':
        home = AdminHomeScreen();
        break;
      default:
        home = AuthScreen();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'АлексФитнес',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: home,
    );
  }
}
