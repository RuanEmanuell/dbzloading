import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/sprite.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import "package:flame/game.dart";
import 'dart:async';


//Vegeta game screen
class VegetaPlay extends StatelessWidget{
  const VegetaPlay({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Color.fromRGBO(53, 113, 252, 1),
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
      body:GameWidget(game: VegetaGame())
    );
  }
}

class VegetaGame extends FlameGame with TapDetector{
  
  late SpriteAnimation idleAnimation;
  late SpriteAnimation tapAnimation;


  late SpriteAnimationComponent vegeta;
  late SpriteComponent background;
  late SpriteComponent ballon;
  late SpriteComponent endingBackground;

  double vegetaSize=200;

  int count=0;

  int tap=0;


  TextPaint countText=TextPaint(style: const TextStyle(
    fontSize:30,
    color:Colors.black,
    fontWeight:FontWeight.bold
  ));



  @override
  Future<void> onLoad() async{
    await super.onLoad();

    //Loading sprites and the music

    final screenWidth=size[0];
    final screenHeight=size[1];


    final spriteSheet=SpriteSheet(image:await images.load("vegeta.png"), srcSize:Vector2(256,400));

    idleAnimation=spriteSheet.createAnimation(row: 0,stepTime:1, to:1);
    tapAnimation=spriteSheet.createAnimation(row: 0,stepTime:1, from:1, to:2);

    background=SpriteComponent()
     ..sprite=await loadSprite("gravity.png")
     ..size=size;

     add(background);
  
    vegeta=SpriteAnimationComponent()
    ..animation=idleAnimation
    ..y=screenHeight-300
    ..x=10
    ..size=Vector2(vegetaSize, vegetaSize);

    add(vegeta);

    ballon=SpriteComponent()
     ..sprite=await loadSprite("ballon.png")
     ..y=vegeta.y+30
     ..x=vegeta.x+170
     ..size=Vector2(200,200);

     add(ballon);

    FlameAudio.bgm.stop();
    FlameAudio.bgm.play("vegeta.mp3");
    
  }


  @override
  void update(double dt){
    super.update(dt);

      //Defining which sprite will be showed based on how many times the player tapped the screen
      if(tap==0){
        vegeta.animation=idleAnimation;
      }else{
        vegeta.animation=tapAnimation;
      }

   
  }

  @override
  void render(Canvas canvas){
    super.render(canvas);
    //Rendering the count of push-ups
    if(count<1000){
      countText.render(canvas, count.toString(), Vector2(vegeta.x+250, vegeta.y+105));
    }
  }




  @override
  void onTap() async{

    tap++;

    if(tap>1){
      tap=0;
      count++;
    }

    //Defining the win conditions(1000 push-ups on the counter) and showing the win screen
    if(count>=1000){

      endingBackground=SpriteComponent()
      ..sprite=await loadSprite("vegetaending.png")
      ..size=size;

      add(endingBackground);

      FlameAudio.bgm.stop();
      FlameAudio.bgm.play("endingmusic.mp3");

    }
   
  }


  
}



