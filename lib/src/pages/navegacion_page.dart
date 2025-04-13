// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// Vamos a hacer que un Widget dispare una animación que se encuentra en otro Widget.
// Usamos Provider.
class NavegacionPage extends StatelessWidget {
  const NavegacionPage({super.key});

   @override
    Widget build(BuildContext context) {
      // Creamos instancia de nuestro provider _NotificationModel
      return ChangeNotifierProvider(
        create: (_) => _NotificationModel(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink,
            title: Text('Notifications Page'),
          ),
          floatingActionButton: BotonFlotante(),
          bottomNavigationBar: BottomNavigation(),
        ),
      );
    }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {

    final int numero = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon(FontAwesomeIcons.bone)
        ),

        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: [
              FaIcon(FontAwesomeIcons.bell),

              Positioned(
                top: 0,
                right: 0,

                // Una forma de obtener el punto de la notificación, pero sin el número dentro.
                //
                // child: Icon(Icons.brightness_1, size: 8, color: Colors.redAccent)

                // Segunda forma de obtener el punto de la notificación, con el número dentro.
                // Le añadimos animaciones.
                // Cualquier animación que contenga In, empieza con la opacidad en 0.
                child: (numero == 1)
                ? BounceInDown(
                    from: 10,
                    child: _NotificationDot(numero: numero),
                  )
                : (numero > 1)
                  ? Bounce(
                      // Cuando Flutter reconstruye un widget (como en este caso el Bounce),
                      // por defecto intenta reciclar el widget anterior si:
	                    //    Está en la misma posición del árbol.
	                    //    Tiene el mismo tipo (Bounce) y la misma clave (o ninguna).
                      // Sino hacemos el key Flutter dice: Este es el mismo Bounce, no lo vuelvo a montar.
                      // Con key, Flutter dice: Este es un nuevo widget cada vez que numero cambia, trátalo como nuevo.
                      key: ValueKey(numero),
                      from: 10,
                      // Recordar que por defecto las animaciones solo se ejecutan una vez.
                      // Con este controller vamos a hacer que cada vez que se pulse el botón de
                      // añadir notificaciones, se lance la animación. Usa Provider.
                      controller: (controller) => Provider.of<_NotificationModel>(context, listen: false).bounceController = controller,
                      child: _NotificationDot(numero: numero),
                    )
                  : SizedBox.shrink()
                )
            ],
          )
        ),


        BottomNavigationBarItem(
          label: 'My Dog',
          icon: FaIcon(FontAwesomeIcons.dog),
        ),
      ]
    );
  }
}

class _NotificationDot extends StatelessWidget {
  final int numero;

  const _NotificationDot({
    required this.numero,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        shape: BoxShape.circle
      ),
      child: Text('$numero', style: TextStyle(color: Colors.white, fontSize: 7)),
    );
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      foregroundColor: Colors.white,
      child: FaIcon(FontAwesomeIcons.play),
      onPressed: () {
        final notiModel = Provider.of<_NotificationModel>(context, listen: false);
        notiModel.numero++;

        if (notiModel.numero >= 2) {
          final controller = notiModel.bounceController;
          controller?.forward(from: 0.0);
        }
      }
    );
  }
}


class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  AnimationController? _bounceController;

  int get numero => _numero;

  set numero(int valor) {
    _numero = valor;
    notifyListeners();
  }

  AnimationController? get bounceController => _bounceController;

  set bounceController(AnimationController? controller) {
    _bounceController = bounceController;
  }
}
