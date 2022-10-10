import 'package:flutter/material.dart';

import 'screen/home_page.dart';
import 'screen/result_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(primary: Colors.black)),
      routes: {
        '/': (context) => const HomePage(),
        'result_page': (context) => const ResultPage(),
      },
    ),
  );
}
