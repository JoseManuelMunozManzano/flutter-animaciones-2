import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class XtwitterPage extends StatefulWidget {
  const XtwitterPage({super.key});

  @override
  State<XtwitterPage> createState() => _XtwitterPageState();
}

class _XtwitterPageState extends State<XtwitterPage> {
  bool activar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Disparando la animación de manera manual la primera vez.
      // Primero con Stateful Widget y luego con Provider.
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        child: FaIcon(FontAwesomeIcons.play),
        onPressed: () {
          setState(() {
            activar = true;
          });
        },
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: ZoomOut(
          // Para poder lanzar manualmente la animación la primera vez.
          // Cambiando esta propiedad a true, se ejecutará la animación.
          animate: activar,
          from: 30,
          duration: Duration(seconds: 1),
          child: FaIcon(
            FontAwesomeIcons.xTwitter,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
