import 'package:flutter/material.dart';

class CustomTile extends StatefulWidget {
  String date;
  String percent;
  String temp;

  CustomTile(
      {super.key,
      required this.date,
      required this.percent,
      required this.temp});

  @override
  State<CustomTile> createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(6),
      child:  Column(
        children: [
          Text(widget.date),
          Text('${widget.percent}%'),
          SizedBox(height: 30),
          Text('${widget.temp}°C'),
        ],
      ),
    );
  }
}
