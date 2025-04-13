import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:animate_do_app/src/pages/navegacion_page.dart';
import 'package:animate_do_app/src/pages/xtwitter_page.dart';

// La animación se realiza al iniciar la app. No se vuelve a animar con hot reloads.
// Hay que hacer un hot restart para volver a animarlo.
// Podemos usar el paquete animate_do en todo aquello que acepte un Widget.
class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

   @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: FadeIn(
            duration: Duration(milliseconds: 500),
            child: Text('Animate_do')
          ),
          actions: [
            IconButton(
              icon: FaIcon(FontAwesomeIcons.xTwitter),
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => XtwitterPage()),
              );

              },
            ),

            SlideInLeft(
              from: 100,
              // El objetivo es navegar a la misma página para que las animaciones
              // se vuelven a ejecutar, evitando así el hot restart.
              child: IconButton(
                icon: Icon(Icons.navigate_next),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => Pagina1Page(),
                    )
                  );
                },
              ),
            ),
          ],
        ),

        floatingActionButton: ElasticInRight(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavegacionPage(),
                )
              );
            },
            child: FaIcon(FontAwesomeIcons.play),
          ),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElasticIn(
                delay: Duration(milliseconds: 1100),
                child: Icon(Icons.new_releases, color: Colors.blue, size: 40)
              ),
              FadeInDown(
                delay: Duration(milliseconds: 200),
                child: Text('Titulo', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200))
              ),
              FadeInDown(
                delay: Duration(milliseconds: 800),
                child: Text('Soy un texto pequeño', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
              ),
              FadeInLeft(
                delay: Duration(milliseconds: 1100),
                child: Container(
                  width: 220,
                  height: 2,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
      );
    }
}
