import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:developer';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late IO.Socket socket;
  String _message = '';

  void initState() {
    super.initState();

    //end point local
    socket = IO.io('http://192.168.1.99:3000/gpsxtu', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();

    socket.onConnect((_) {
      print('connect');
      socket.emit('msg', 'test');
    });

  socket.emit('observarDatos', {'data': 'data'});
    socket.on('datosActualizados', (data) => {
      //socket.emit('observarDatos', {'data': 'data'}),
      setState(() {
        _message = data;
      }), 
      log(data)
    });
    
    socket.onDisconnect((_) => print('disconnect'));

     // Consultar el servidor cada 4 segundos
    // Timer.periodic(const Duration(seconds: 4), (timer) {
    //   socket.emit('observarDatos', {'data': 'data'});
    // });

    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Socket Example'),
        ),
        body: Center(
          child: Text
          (
            
            _message
            ),
        ),
      ),
    );
  }
}

//TODO: clase control 
// To parse this JSON data, do
//
//     final control = controlFromJson(jsonString);









// import 'package:socket_io_client/socket_io_client.dart' as IO;


// void main() {
//   // Crea una instancia de Socket.IO con la URL del servidor
//   IO.Socket socket = IO.io('http://192.168.1.99:3000/gpsxtu');

//   // Escucha el evento "connect" para saber cuándo se ha establecido la conexión
//   socket.on('connect', (_) {
//     print('Conectado al servidor Socket.IO');
//   });

//   // Envía un evento al servidor Socket.IO
//   socket.emit('observarDatos', 'Hola, servidor!');

//   // Escucha el evento "mensaje" para recibir mensajes del servidor Socket.IO
//   socket.on('mensaje', (data) {
//     print('Mensaje recibido del servidor Socket.IO: $data');
//   });
// }