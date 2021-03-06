

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  Online,
  Connecting,
  Offline
  
}


class SocketService with ChangeNotifier {

  ServerStatus _serverStatus = ServerStatus.Connecting;
  
  IO.Socket _socket;

  ServerStatus get serverStatus => this._serverStatus;
  
  IO.Socket get socket => this._socket;
  Function get emit => this._socket.emit;

  

  SocketService(){
    print('Entrando');
    this._initConfig();
  }

  void _initConfig() {
    
    // Dart client
    this._socket = IO.io('http://192.168.200.8:3000', {
      'transports': ['websocket'],
      'autoConnect': true,
    });

    this._socket.on('connect', (_) {
      print('cxcxcxcxcx');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    this._socket.on('disconnect', (_) {
      print('cxcxcxcxcx');
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    /*this._socket.on('nuevo-mensaje', (payload) {
      print('nuevo-mensaje: $payload');
      print('nombre:'+ payload['nombre']);
      print('nombre:'+ payload['mensaje']);
      print(payload.containsKey('mensaje2')?payload['mensaje2']:'no hay');
    });*/

    //Para emitir mensajes
    

  }

}