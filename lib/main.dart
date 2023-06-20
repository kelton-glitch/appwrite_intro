import 'package:appwrite_authentication/appwrite/auth_api.dart';
import 'package:appwrite_authentication/pages/login_page.dart';
import 'package:appwrite_authentication/pages/tabs_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthAPI(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final value = context.watch<AuthAPI>().status;
    print('TOP CHANGE Value changed to: $value!');

    return MaterialApp(
      title: 'Appwrite Authentication Demo',
      debugShowCheckedModeBanner: false,
      home: value == AuthStatus.uninitialized
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : value == AuthStatus.authenticated
              ? const TabsPage()
              : const LoginPage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFE91052),
        ),
      ),
    );
  }
}
