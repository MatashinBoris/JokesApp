import 'dart:io'; //InternetAddress utility
import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart'; //For StreamController/Stream

class ConnectionStatus {
 bool isOnline = false;

 Future<void> checkConnect() async {
   try {
     final result = await InternetAddress.lookup('google.com');
     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
       print('connected');
       isOnline = true;
     }
   } on SocketException catch (_) {
     print('not connected');
     isOnline = false;
   }
 }


 Future<bool> isInternet() async {
   var connectivityResult = await (Connectivity().checkConnectivity());
   if (connectivityResult == ConnectivityResult.mobile) {
     // I am connected to a mobile network, make sure there is actually a net connection.
     if (await DataConnectionChecker().hasConnection) {
       // Mobile data detected & internet connection confirmed.
       return true;
     } else {
       // Mobile data detected but no internet connection found.
       return false;
     }
   } else if (connectivityResult == ConnectivityResult.wifi) {
     // I am connected to a WIFI network, make sure there is actually a net connection.
     if (await DataConnectionChecker().hasConnection) {
       // Wifi detected & internet connection confirmed.
       return true;
     } else {
       // Wifi detected but no internet connection found.
       return false;
     }
   } else {
     // Neither mobile data or WIFI detected, not internet connection found.
     return false;
   }
 }
}