import 'package:flutter/material.dart';

class VerticalListTile extends StatefulWidget {
  String date;
  String percent;
  String temp;

  VerticalListTile(
      {super.key,
        required this.date,
        required this.percent,
        required this.temp});

  @override
  State<VerticalListTile> createState() => _VerticalListTileState();
}

class _VerticalListTileState extends State<VerticalListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1,color: Colors.grey))
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Column(
           children: [
             Text(widget.date),
             Text('${widget.percent}%'),
           ],
         ),
          SizedBox(
              height: 50,
              width: 50,
              child: Image.network('https://picsum.photos/200/300',fit: BoxFit.cover,))
        ],
      ),
    );
  }
}
