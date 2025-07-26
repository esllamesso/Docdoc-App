import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  final String text;
  final Widget? trailing;
  final Color ? color;

  const TopBar({super.key, required this.text, this.trailing,this.color});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){Navigator.pushReplacementNamed(context, '/home');
        }, icon: Icon(Icons.arrow_back_ios_new,color: widget.color,)),
        Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: widget.color,
          ),
        ),
        widget.trailing ?? SizedBox(width: 45),
      ],
    );
  }
}
