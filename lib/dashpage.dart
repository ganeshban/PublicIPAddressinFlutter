import 'package:flutter/material.dart';
import 'package:dart_ipify/dart_ipify.dart';

class DashBord extends StatefulWidget {
  const DashBord({Key? key}) : super(key: key);

  @override
  _DashBordState createState() => _DashBordState();
}

Future<String?> getMyPublicIp() async {
  try {
    final myPublicIP = await Ipify.ipv64();
    return myPublicIP;
  } catch (e) {
    return e.toString();
  }
}

class _DashBordState extends State<DashBord> {
  String? data = '';

  void setData() {
    getMyPublicIp().then((value) => setState(() {
          data = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    setData();
    return Scaffold(
      body: Center(child: Text(data.toString())),
    );
  }
}
