import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'alerting.dart';

enum NetworkStatus {
  online,
  offline,
}

class NetworkService {
  StreamController<NetworkStatus> streamController = StreamController();
  final _connectivity = Connectivity();
  NetworkService() {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      streamController.add(_networkStatus(result));
    });
  }
  NetworkStatus _networkStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        debugPrint("Connection by wifi");
        return NetworkStatus.online;
      case ConnectivityResult.mobile:
        debugPrint("Connection by internet");
        return NetworkStatus.online;
      case ConnectivityResult.none:
        debugPrint("Connect none");
        return NetworkStatus.offline;
      default:
        alertErrorSnackbar(
            title: "Network Error",
            message: "Failed to get network connection");
        return NetworkStatus.offline;
    }
  }

//   _updateConnectionStatus(ConnectivityResult result) {
//     switch (result) {
//       case ConnectivityResult.wifi:
//         debugPrint("Connection by wifi");
//         conectionStatus = 1;
//         break;
//       case ConnectivityResult.mobile:
//         debugPrint("Connection by internet");
//         conectionStatus = 2;
//         break;
//       case ConnectivityResult.none:
//         debugPrint("Connect none");
//         conectionStatus = 0;
//         break;
//       default:
//         alertErrorSnackbar(
//             title: "Network Error",
//             message: "Failed to get network connection");
//         break;
//     }
//     notifyListeners();
//   }
}

class NetworkProvider extends ChangeNotifier {
  void onInit() {
    debugPrint("checking network controller");
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    notifyListeners();
  }

  void onClose() {
    _connectivitySubscription.cancel();
    notifyListeners();
  }

  var conectionStatus = 0;
  final _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
      return _updateConnectionStatus(result);
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  Future<void> test() async {}
  _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        debugPrint("Connection by wifi");
        conectionStatus = 1;
        break;
      case ConnectivityResult.mobile:
        debugPrint("Connection by internet");
        conectionStatus = 2;
        break;
      case ConnectivityResult.none:
        debugPrint("Connect none");
        conectionStatus = 0;
        break;
      default:
        alertErrorSnackbar(
            title: "Network Error",
            message: "Failed to get network connection");
        break;
    }
    notifyListeners();
  }
}

class NetworkBinding extends Bindings with ChangeNotifier {
  @override
  void dependencies() {
    debugPrint("network binding dependencies");
    var netProvider = NetworkProvider();
    netProvider.onInit();
    // notifyListeners();
  }
}
