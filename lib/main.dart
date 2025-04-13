import 'package:flutter/material.dart';

import 'package:animate_do_app/src/pages/pagina1_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animate_do',
      home: Pagina1Page()
    );
  }
}
