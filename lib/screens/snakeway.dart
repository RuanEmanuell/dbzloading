import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/sprite.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import "package:flame/game.dart";
import "package:flame/parallax.dart";

class SnakeWayPlay extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        backgroundColor:const Color.fromRGBO(193, 73, 169,1),
        elevation:0,
        leading:IconButton(
          icon:const Icon(Icons.arrow_back, size:40),
          color:Colors.black,
          onPressed:(){
            Navigator.pop(context);
            FlameAudio.bgm.stop();
          }
        )
      ),
      body:GameWidget(game: SnakeWayGame())
    );
  }
}


class SnakeWayGame extends FlameGame with TapDetector{
  
  late SpriteAnimation idleAnimation;
  late SpriteAnimation tapAnimation;

  late SpriteAnimationComponent goku;
  late SpriteComponent sky;
  late SpriteComponent path;
  late SpriteComponent minigoku;
  late SpriteComponent minisnakeway;
  late SpriteComponent endingBackground;

  double gokuSize=100;

  int tap=0;

  int count=1000;
 

   TextPaint countText=TextPaint(style: const TextStyle(
    fontSize:20,
    color:Colors.black,
    fontWeight:FontWeight.bold
  ));


  @override
  Future<void> onLoad() async{
    await super.onLoad();

    final screenWidth=size[0];
    final screenHeight=size[1];


    final spriteSheet=SpriteSheet(image:await images.load("gokusnakeway.png"), srcSize:Vector2(300,500));

    idleAnimation=spriteSheet.createAnimation(row: 0,stepTime:1, to:1);
    tapAnimation=spriteSheet.createAnimation(row: 0,stepTime:1, from:1, to:2);

    ParallaxComponent sky=await ParallaxComponent.load([
      ParallaxImageData("sky.png"),
    ],
    baseVelocity:Vector2(2.5, 0),
    velocityMultiplierDelta:Vector2.all(2)
    );

     add(sky);


    path=SpriteComponent()
    ..sprite=await loadSprite("path.png")
    ..size=size;

    add(path);


  
    goku=SpriteAnimationComponent()
    ..animation=idleAnimation
    ..y=screenHeight-240
    ..x=screenWidth-100
    ..size=Vector2(gokuSize, gokuSize*1.5);

    add(goku);

    minisnakeway=SpriteComponent()
    ..sprite=await loadSprite("minisnakeway.png")
    ..y=screenHeight-500
    ..x=screenWidth-335
    ..size=Vector2(300, 60);

    add(minisnakeway);
    

    minigoku=SpriteComponent()
    ..sprite=await loadSprite("gokuhead.png")
    ..y=screenHeight-490
    ..x=screenWidth-300
    ..size=Vector2(60, 50);

    add(minigoku);

    FlameAudio.bgm.stop();
    FlameAudio.bgm.play("snakeway.mp3");


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
  void render(Canvas canvas){
    super.render(canvas);
    if(count>0){
    countText.render(canvas, "Kilometers left: ${count.toString()}", Vector2(size[0]-275, size[1]-420));
    }
  }



  @override
  void onTap() async{
    tap++;
    if(tap>1){
      tap=0;
        count-=3;
        goku.x-=0.8;
        minigoku.x+=0.5;
    }
    if(count<=0){
      endingBackground=SpriteComponent()
      ..sprite=await loadSprite("snakewayending.png")
      ..size=size;

      add(endingBackground);
      FlameAudio.bgm.stop();
      FlameAudio.bgm.play("endingmusic.mp3");
    }
   
  }


  
}



