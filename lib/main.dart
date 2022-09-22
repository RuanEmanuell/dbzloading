import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import "package:flame/game.dart";
import "package:flame/parallax.dart";
import "package:flame/geometry.dart";
import "package:flame/collisions.dart";

void main() {
  runApp(GameWidget(game:DBZGame()));
}


class DBZGame extends FlameGame with TapDetector{
  
  late SpriteAnimation idleAnimation;
  late SpriteAnimation tapAnimation;


  late SpriteAnimationComponent vegeta;
  late SpriteComponent background;
  late SpriteComponent ballon;

  double vegetaSize=200;

  int tap=0;

  int count=0;

  TextPaint countText=TextPaint(style: TextStyle(
    fontSize:30,
    color:Colors.black,
    fontWeight:FontWeight.bold
  ));

 

  @override
  Future<void> onLoad() async{
    await super.onLoad();

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
    


  }


  @override
  void update(double dt){
    super.update(dt);

      if(tap==0){
        vegeta.animation=idleAnimation;
      }else{
        vegeta.animation=tapAnimation;
      }
   
  }

  @override
  void render(Canvas canvas){
    super.render(canvas);
    countText.render(canvas, count.toString(), Vector2(vegeta.x+250, vegeta.y+105));
  }




  @override
  void onTap() {
    tap++;
    if(tap>1){
      tap=0;
      count++;
    }
   
  }


  
}



