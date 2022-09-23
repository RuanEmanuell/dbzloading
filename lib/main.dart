import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/sprite.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import "package:flame/game.dart";
import 'package:stroke_text/stroke_text.dart';


import "screens/vegeta.dart";
import "screens/goku.dart";
import "screens/snakeway.dart";
import "screens/gotenks.dart";

void main(){
  runApp(MaterialApp(
    home:MyApp())
  );
}


class MyApp extends StatelessWidget{
  

  @override
  
  Widget build(BuildContext context){
    var screenWidth=MediaQuery.of(context).size.width;
    var screenHeight=MediaQuery.of(context).size.width;
    return Scaffold(
        body:Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin:const EdgeInsets.only(
                  left:62,
                  right:62,
                  top:20
                ),
                height:screenHeight/6,
                decoration:BoxDecoration(
                  image:const DecorationImage(image:const AssetImage("assets/images/vegetamenu.png"), opacity:0.5),
                  borderRadius:BorderRadius.circular(20)
                ),
                child:Row(
                  children:[
                    Expanded(
                      child:Container(
                        margin:const EdgeInsets.only(left: 20),
                        child:const StrokeText(
                        strokeWidth: 2,
                        text:"Vegeta's Workout", 
                        textStyle:TextStyle(
                        fontFamily:"Tahoma",
                        fontWeight:FontWeight.bold,
                        color:Colors.blue,
                        fontSize:20,
                      ))
                      )
                    ),
                    Container(
                      margin:EdgeInsets.only(right: 25, bottom:20),
                      child:IconButton(
                      icon:const Icon(Icons.arrow_drop_down, size:60, color:Colors.blue),
                      onPressed:(){
                          showModalBottomSheet<void>(
                            context:context,
                            builder:(BuildContext context){
                              return Container(
                                height:screenHeight,
                                width:screenWidth,
                                color:Color.fromARGB(255, 0, 57, 104),
                                child:Column(
                                  mainAxisAlignment:MainAxisAlignment.center,
                                  children:[
                                    Container(
                                      padding:EdgeInsets.all(20),
                                      margin:EdgeInsets.all(20),
                                      height:screenHeight/2,
                                      width:screenWidth,
                                      decoration:BoxDecoration(
                                        color:Colors.white,
                                        borderRadius:BorderRadius.circular(15)
                                      ),
                                      child:Text("That damn Kakarot, he is always one step ahead of me. Can you help me with my training? I promise you I can surpass that bastard if i do 1000 push-ups...",
                                      style:TextStyle(
                                        fontSize:20
                                      ))
                                    ),
                                      Container(
                                          margin:EdgeInsets.all(20),
                                          width:screenWidth,
                                          height:screenHeight/5,
                                          child:ElevatedButton(
                                          child:Text("Play", style:TextStyle(
                                            fontSize:20
                                          )),
                                          onPressed:(){
                                            Navigator.push(
                                            context,
                                            MaterialPageRoute(builder:(context)=>VegetaPlay())
                                            );
                                          }
                                        )
                                        )
                                  ]
                                )
                              );
                            }
                          );
                      }
                    )
                    )
                  ]
                )
              ),
  
    
              
            ],
          ),
        )
      );
  }
}

