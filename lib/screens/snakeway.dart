import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import "package:flame/game.dart";
import "package:flame/parallax.dart";

class SnakeWayPlay extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Color.fromRGBO(227, 102, 204,1),
        elevation:0,
        leading:IconButton(
          icon:Icon(Icons.arrow_back, size:40),
          color:Colors.black,
          onPressed:(){
            Navigator.pop(context);
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

  double gokuSize=100;

  int tap=0;

  int count=1000;
 

   TextPaint countText=TextPaint(style: TextStyle(
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
    baseVelocity:Vector2(5, 0),
    velocityMultiplierDelta:Vector2.all(2)
    );

     add(sky);


    path=SpriteComponent()
    ..sprite=await loadSprite("path.png")
    ..size=size;

    add(path);


  
    goku=SpriteAnimationComponent()
    ..animation=idleAnimation
    ..y=screenHeight-250
    ..x=screenWidth-100
    ..size=Vector2(gokuSize, gokuSize*1.5);

    add(goku);

    minisnakeway=SpriteComponent()
    ..sprite=await loadSprite("minisnakeway.png")
    ..y=screenHeight-600
    ..x=screenWidth-350
    ..size=Vector2(300, 60);

    add(minisnakeway);
    

    minigoku=SpriteComponent()
    ..sprite=await loadSprite("gokuhead.png")
    ..y=screenHeight-590
    ..x=screenWidth-300
    ..size=Vector2(60, 50);

    add(minigoku);


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
    countText.render(canvas, "Kilometers left: ${count.toString()}", Vector2(size[0]-285, size[1]-520));
  }



  @override
  void onTap() {
    tap++;
    if(tap>1){
      tap=0;
      if(count<500){
      count-=2;
      goku.x-=0.5;
      minigoku.x+=0.2;
      }else{
        count-=3;
        goku.x-=0.75;
        minigoku.x+=0.3;
      }
    }
   
  }


  
}



