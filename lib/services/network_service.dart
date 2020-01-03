import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:my_eme/utils/network_status.dart';

class ConnectivityService {
  StreamController<ConnectivityStatus> connectionStreamController =
      StreamController<ConnectivityStatus>();

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStreamController.add(getStatusFromResult(result));
    });
  }

  ConnectivityStatus getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
        break;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
        break;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
        break;
      default:
        return ConnectivityStatus.Offline;
    }
  }
}
