import 'package:flutter/material.dart';
 
void main() => runApp(CoviSource());
 
class CoviSource extends StatefulWidget {
  @override
  _CoviSourceState createState() => _CoviSourceState();
}

class _CoviSourceState extends State<CoviSource> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoviSource',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: Scaffold(
        body: Center(
          
        ),
      ),
    );
  }
}