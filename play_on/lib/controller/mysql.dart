import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class MySql {
  // var host =10.0.2.2 /127.0.0.1
  static String host = '10.0.2.2', db = 'userdb', user = 'root';
  static int port = 3306;
  MySql();
  Future<MySqlConnection> getConnection() async {
    var settings =
        ConnectionSettings(host: host, port: port, user: user, db: db);

    return await MySqlConnection.connect(settings);
  }
}
