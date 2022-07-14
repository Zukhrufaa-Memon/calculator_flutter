
import 'package:calculator_1/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:velocity_x/velocity_x.dart';

class DisplayWithButtonBox extends StatefulWidget {
   const DisplayWithButtonBox({Key? key}) ;

  @override
  State<DisplayWithButtonBox> createState() => _DisplayWithButtonBoxState();
}

class _DisplayWithButtonBoxState extends State<DisplayWithButtonBox> {

  String displayValue='0';
  String actualExpression='0';
  //creating an instance of parser for parsin (translation) the expression
  Parser p=Parser();
  //using late keyword to express the late initialization of value
  late Expression parsedExpression;

  void _updateExpressionByAddingValue(String value,{String ? valueToShow}) {
    setState(() {
      if(valueToShow !=null) {
        displayValue +=valueToShow;
        actualExpression +=value;
      }else {
        displayValue +=value;
        actualExpression +=value;
      }
    });
  }

  void evaluate() {
    print('Displayed Expression: '+displayValue);
    print('Actual Expression: '+actualExpression);
    parsedExpression=p.parse(actualExpression);
    setState(() {
      displayValue=actualExpression=parsedExpression
      .evaluate(EvaluationType.REAL, ContextModel()).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        displayValue.text.white.xl6.align(TextAlign.end).make().p(16),
        Container(
              height:430,
              width : 370,
              decoration:
               const BoxDecoration(color:  Color.fromARGB(255, 19, 20, 24),
               borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(32)
               )),
              child: 
               Padding(
               padding: const EdgeInsets.all(16.0),
                 child: 
                 Column(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

               MyButton(
                myButtonText: 'AC',
                color: 0xFF808080,
                buttonTextColor: Colors.black,
                onPressed: (){
                  setState(() {
                     displayValue='';
                     actualExpression='';
                    
                  }); },  ),

               MyButton(
                myButtonText: '+/-',
                color: 0xFF808080,
                buttonTextColor: Colors.black,
                onPressed: (){
                  actualExpression='-'+ actualExpression;
                  displayValue='-'+ displayValue;
               
                },  ),

               MyButton(
                myButtonText: '%',
                color: 0xFF808080,
                buttonTextColor: Colors.black,
                onPressed: (){
                //  _updateExpressionByAddingValue('%');
                   _updateExpressionByAddingValue('*0.01',valueToShow: '%');
                },   ),

               MyButton(
                myButtonText: '÷',
                color: 0xFFFF9900,
                buttonTextColor: Colors.white,
                onPressed: (){
                  _updateExpressionByAddingValue('/',valueToShow: '÷');
                },   )  ],),
               
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

               MyButton(
                myButtonText: '7',
                color: 0xFF43464B,
                buttonTextColor: Colors.white,
                onPressed: () {
                  _updateExpressionByAddingValue('7');
                },    ),

               MyButton(
                myButtonText: '8',
                color: 0xFF43464B,
                buttonTextColor: Colors.white,
                onPressed: () {
                   _updateExpressionByAddingValue('8');
                },),
               MyButton(
                myButtonText: '9',
                color: 0xFF43464B,
                buttonTextColor: Colors.white,
                onPressed: () {
                   _updateExpressionByAddingValue('9');
                }),

               MyButton(
                myButtonText: 'x',
                color: 0xFFFF9900,
                buttonTextColor: Colors.white,
                onPressed: () {
                   _updateExpressionByAddingValue('*',valueToShow: 'x');
                })]
                , ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

               MyButton(
                myButtonText: '4',
                color: 0xFF43464B,
                buttonTextColor: Colors.white,
                onPressed: () {
                   _updateExpressionByAddingValue('4');
                }),

               MyButton(
                myButtonText: '5',
                color: 0xFF43464B,
                buttonTextColor: Colors.white,
                onPressed: () {
                   _updateExpressionByAddingValue('5');
                }),

               MyButton(
                myButtonText: '6',
                color: 0xFF43464B,
                buttonTextColor: Colors.white,
                onPressed: () {
                   _updateExpressionByAddingValue('6');
                }),

               MyButton(
                myButtonText: '-',
                color: 0xFFFF9900,
                buttonTextColor: Colors.white,
                onPressed: () {
                   _updateExpressionByAddingValue('-');
                }) 
                  ],   ),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
             
               MyButton(
                myButtonText: '1',
                color: 0xFF43464B,
                buttonTextColor: Colors.white,
                onPressed: () {
                   _updateExpressionByAddingValue('1');
                }),

               MyButton(
                myButtonText: '2',
                color: 0xFF43464B,
                buttonTextColor: Colors.white,
                onPressed: () {
                   _updateExpressionByAddingValue('2');
                }),

               MyButton(
                myButtonText: '3',
                color: 0xFF43464B,
                buttonTextColor: Colors.white,
                onPressed: () {
                   _updateExpressionByAddingValue('3');
                }),

               MyButton(
                myButtonText: '+',
                color: 0xFFFF9900,
                buttonTextColor: Colors.white,
                onPressed: () {
                   _updateExpressionByAddingValue('+');
                }) 
                   ],),
            
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
             
               MyButton(
                myButtonText: '0',
                color: 0xFF43464B,
                buttonTextColor: Colors.white,
                onPressed: () {
                   _updateExpressionByAddingValue('0');
                }),

               MyButton(
                myButtonText: '.',
                color: 0xFF43464B,
                buttonTextColor: Colors.white,
                onPressed: () {
                   _updateExpressionByAddingValue('.');
                }),

               MyButton(
                myButtonText: '00' ,
                color: 0xFF43464B,
                buttonTextColor: Colors.white,
                onPressed: () {
                   _updateExpressionByAddingValue('00');
                },)
               ,
               MyButton(
                myButtonText: '=',
                color: 0xFFFF9900,
                buttonTextColor: Colors.white,
                onPressed: () {
                  evaluate();
                } ) 
                ], )
              ],
          ))),
      ],
    );
    }
}