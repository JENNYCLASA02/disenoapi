import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context, IconData icon, String title,
    String description, Color color, VoidCallback press) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        icon: Icon(icon, size: 60, color: color),
        title: Text(title),
        content: Text(
          description,
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          TextButton(
            onPressed: press,
            child: const Text('Cerrar', style: TextStyle(color: Colors.black)),
          ),
        ],
      );
    },
  );
}

void showAlertDialogExit(BuildContext context, IconData icon, String title,
    String description, Color color, VoidCallback press) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        icon: Icon(icon, size: 60, color: color),
        title: Text(title),
        content: Text(
          description,
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cerrar', style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Text(
              'Salir',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}

void showAlertDialogInfo(BuildContext context, IconData icon, String title,
    String description, Color color, VoidCallback press) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        icon: Icon(icon, size: 60, color: color),
        title: Text(title),
        content: Text(
          description,
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('¿Cumple los requisitos?',
                style: TextStyle(color: Colors.black)),
          ),
        ],
      );
    },
  );
}
