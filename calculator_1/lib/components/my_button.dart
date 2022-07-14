import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
   MyButton({
    required this.myButtonText,
    required this.color,
    required this.buttonTextColor,
    required this.onPressed}) ;


String myButtonText='';
late int color;
late Color buttonTextColor;
final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
          width:65,height: 65,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100),),
            color: Colors.grey),

          child: FloatingActionButton.small(onPressed: onPressed,
          backgroundColor: Color(color),foregroundColor: buttonTextColor,
          child: Text(myButtonText,
          style: const TextStyle(fontSize: 27,),), ));
         // SizedBox(width: 16,);

  }
}