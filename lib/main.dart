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
import "partials/gametile.dart";

void main(){
  runApp(MaterialApp(
    home:MyApp())
  );
}

class MyApp extends StatefulWidget{
  @override
  _MyApp createState()=> _MyApp();
}


class _MyApp extends State<MyApp>{

  void startMusic(){
    FlameAudio.bgm.play("endingmusic.mp3");
  }
  @override
  void initState(){
    super.initState();
    startMusic();
  }
  @override
  Widget build(BuildContext context){
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
        body:Container(
        height:screenHeight,
        decoration:BoxDecoration(
          color:Color.fromARGB(141, 28, 152, 253),
          image:DecorationImage(
            image:AssetImage("assets/images/dragonballs.png"), 
            opacity:0.5
          )
        ),
        child: Stack(
          children:[
            Center(
            child:Column(
                mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height:100,
                    child:Image.asset("assets/images/dbzlogo.png")
                  ),
                  Container(
                    child: const StrokeText(
                      text:"Choose the mode you wanna play", 
                      strokeWidth:2,
                      textStyle:TextStyle(
                      fontSize:20,
                      color:Colors.white,
                      fontFamily:"Tahoma",
                      fontWeight:FontWeight.bold
                    ))
                  ),
                  Gametile(
                    screen:VegetaPlay(),
                    image:"assets/images/vegetamenu.png",
                    title:"Vegeta's Workout",
                    color:Colors.blue,
                    text:"That damn Kakarot. I promise you I can surpass that bastard once I do 1000 push-ups...",
                    buttonColor:Color.fromARGB(255, 15, 112, 192)
                  ),
                  Gametile(
                    screen:GokuPlay(),
                    image:"assets/images/gokumenu.png",
                    title:"Goku's Lunch Time",
                    color:Colors.orange,
                    text:"Maan I'm hungry! I need to eat so I can go to King Kai's planet to train. I wonder what would happen if I eat all the food...",
                    buttonColor:Color.fromARGB(255, 255, 134, 64)
                  ),
                  Gametile(
                    screen:SnakeWayPlay(),
                    image:"assets/images/snakewaymenu.png",
                    title:"Snakeway Run",
                    color:Color.fromARGB(255, 231, 214, 55),
                    text:"The Saiyans are coming to Earth! I gotta hurry and run as fast as I can to arrive at King Kai's planet!",
                    buttonColor:Color.fromARGB(255, 192, 178, 54),
                  ),
                  Gametile(
                    screen:GotenksPlay(),
                    image:"assets/images/gotenksmenu.png",
                    title:"Superghost Invasion",
                    color:Colors.lightBlue,
                    text:"Majin Buu is SUPER strong! I need to make an army of ghosts so I can defeat him once and for all! Maybe 50?",
                    buttonColor:Color.fromARGB(255, 31, 100, 219)
                  )
                ],
              )
            ),
            Container(
              margin:EdgeInsets.only(top: screenHeight/1.2, left:screenWidth/1.3),
              child:Image.asset("assets/images/gokutitle.png")
            )
           ]
        ),
          ),
      );
  }
}

