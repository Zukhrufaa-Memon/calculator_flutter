
import 'package:calculator_1/components/button_box.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class FlutterCalculator extends StatelessWidget {
  const FlutterCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Column(
          children:  [

            Spacer(),
            DisplayWithButtonBox(),
            
           ],
        ),
      ),
        
   );
  }
}
