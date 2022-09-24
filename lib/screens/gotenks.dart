import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/sprite.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import "package:flame/game.dart";
import 'dart:math';


//Gotenks game screen
class GotenksPlay extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Color.fromARGB(255, 255, 255, 255),
        elevation:0,
        leading:IconButton(
          icon:Icon(Icons.arrow_back, size:40),
          color:Colors.black,
          onPressed:(){
            Navigator.pop(context);
            FlameAudio.bgm.stop();
          }
        )
      ),
      body:GameWidget(game: GotenksGame())
    );
  }
}


class GotenksGame extends FlameGame with TapDetector{
  
  late SpriteAnimation tap1Animation;
  late SpriteAnimation tap2Animation;
  late SpriteAnimation tap3Animation;

  late SpriteAnimationComponent gotenks;
  late SpriteComponent background;
  late SpriteComponent ghost;
  late SpriteComponent endingBackground;


  double gotenksSize=150;

  double tap=0;
  int count=0;
  int previousCount=0;
  bool end=false;



  @override
  Future<void> onLoad() async{
    await super.onLoad();

    //Loading sprites and the music

    final screenWidth=size[0];
    final screenHeight=size[1];


    final spriteSheet=SpriteSheet(image:await images.load("gotenks.png"), srcSize:Vector2(300,500));

    tap1Animation=spriteSheet.createAnimation(row: 0,stepTime:1, to:1);
    tap2Animation=spriteSheet.createAnimation(row: 0,stepTime:1, from:1, to:2);
    tap3Animation=spriteSheet.createAnimation(row: 0,stepTime:1, from:2, to:3);

    background=SpriteComponent()
     ..sprite=await loadSprite("timechamber.png")
     ..size=size;

     add(background);
  
    gotenks=SpriteAnimationComponent()
    ..animation=tap1Animation
    ..y=screenHeight-250
    ..x=100
    ..size=Vector2(gotenksSize, gotenksSize*1.5);

    add(gotenks);

    FlameAudio.bgm.stop();
    FlameAudio.bgm.play("gotenks.mp3");

  }


  @override
  void update(double dt){
    super.update(dt);

      //Defining which sprite will be showed based on how many times the player tapped the screen
      if(tap==0){
        gotenks.animation=tap1Animation;
      }
      if(tap==1){
        gotenks.animation=tap2Animation;
      }
      if(tap==2){
        gotenks.animation=tap3Animation;
      }
      
    
  }


  @override
  void onTap() async {

    var rng=Random();
    final screenWidth=size[0].toInt();
    final screenHeight=size[1].toInt();

    
    tap++;

    //When the player tap 3 times, increase the var count to spawn the ghost
    if(tap>2){
      tap=0;
      count++;
    }

    //Defining the random place the ghost will spawn
    if(count==previousCount+1){

      ghost=SpriteComponent()
      ..sprite=await loadSprite("ghost.png")
      ..y=rng.nextInt(screenHeight)/1.5
      ..x=rng.nextInt(screenWidth)/1.5
      ..size=Vector2(gotenksSize, gotenksSize);

      add(ghost);
      
      previousCount=count;
    }

    //Defining the win conditions and showing the win screen
    if(count>50){
      endingBackground=SpriteComponent()
      ..sprite=await loadSprite("gotenksending.png")
      ..size=size;

      add(endingBackground);

      FlameAudio.bgm.stop();
      FlameAudio.bgm.play("endingmusic.mp3");
    }

  }



  
}
