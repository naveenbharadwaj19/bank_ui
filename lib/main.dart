import 'package:bank_ui/history_screen.dart';
import 'package:bank_ui/theme.dart';
import 'package:bank_ui/transfer_screen.dart';
import 'package:flutter/material.dart';

import 'get_started_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BANK',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      routes: {
        TransferScreen.routeName: (context) => TransferScreen(),
        HistoryScreen.routeName :(context) => HistoryScreen(),
      },
      home: GetStartedScreen(),
    );
  }
}
