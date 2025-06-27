import 'package:alexfitnes/my_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:postgres/postgres.dart';

import 'services/api_service.dart';
import 'services/auth_service.dart';
// import 'package:alexfitnes/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final connection = await Connection.open(
    Endpoint(
      host: '10.0.2.2', // Android эмулятор localhost
      port: 5432,
      database: 'AlexFitnes',
      username: 'postgres',
      password: '12345',
    ),
    settings: const ConnectionSettings(sslMode: SslMode.disable),
  );

  print('Успешное подключение к базе данных!');

  runApp(
    MultiProvider(
      providers: [
        Provider<Connection>.value(value: connection),
        Provider<AuthService>(create: (_) => AuthService()),
        Provider<LoginPage>(create: (_) => LoginPage()), // api service
      ],
      child: const MyApp(),
    ),
  );
}
