import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';
import "package:flame/game.dart";

class GokuPlay extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Color.fromRGBO(228, 174, 83,1),
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
      body:GameWidget(game: GokuGame())
    );
  }
}


class GokuGame extends FlameGame with TapDetector{
  
  late SpriteAnimation idleAnimation;
  late SpriteAnimation tapAnimation;

  late SpriteAnimation bowlZeroTapAnimation;
 

  late SpriteAnimationComponent goku;
  late SpriteComponent background;
  late SpriteComponent bowl;
  late SpriteComponent endingBackground;

  double gokuSize=350;

  int tap=0;
  int count=0;
  int previousCount=0;
  bool end=false;

  @override
  Future<void> onLoad() async{
    await super.onLoad();

    final screenWidth=size[0];
    final screenHeight=size[1];


    final spriteSheet=SpriteSheet(image:await images.load("goku.png"), srcSize:Vector2(300,500));

    idleAnimation=spriteSheet.createAnimation(row: 0,stepTime:1, to:1);
    tapAnimation=spriteSheet.createAnimation(row: 0,stepTime:1, from:1, to:2);

    background=SpriteComponent()
     ..sprite=await loadSprite("house.png")
     ..size=size;

     add(background);
  
    goku=SpriteAnimationComponent()
    ..animation=idleAnimation
    ..y=screenHeight-550
    ..x=10
    ..size=Vector2(gokuSize, gokuSize*1.5);

    add(goku);

    FlameAudio.bgm.stop();
    FlameAudio.bgm.play("goku.mp3");

  }


  @override
  void update(double dt){
    super.update(dt);

      if(tap==0){
        goku.animation=idleAnimation;
      }else{
        goku.animation=tapAnimation;
      }
      
    
  }


  @override
  void onTap() async {
    final bowlHeight=size[1]-300;

    if(end==false){
    tap++;
    }


    if(tap>1){
      tap=0;
      count++;
    }

    if(count==previousCount+10){
      bowl=SpriteComponent()
      ..sprite=await loadSprite("bowl.png")
      ..y=bowlHeight-previousCount.toDouble()
      ..x=240
      ..size=Vector2(80, 80);

      add(bowl);

      previousCount=count;
    }

    if(count>=size[1]/2){
      end=true;

      endingBackground=SpriteComponent()
      ..sprite=await loadSprite("gokuending.png")
      ..size=size;

      add(endingBackground);
      FlameAudio.bgm.stop();
      FlameAudio.bgm.play("endingmusic.mp3");
    }


  }



  
}
