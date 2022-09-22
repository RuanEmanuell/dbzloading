import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import "package:flame/game.dart";


import "screens/vegeta.dart";
import "screens/goku.dart";
import "screens/snakeway.dart";

void main(){
  runApp(MaterialApp(
    home:myApp()
  ));
}


class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body:Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                child:Text("Vegeta"),
                onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>VegetaPlay())
                  );
                }
              ),
              ElevatedButton(
                child:Text("Goku"),
                onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>GokuPlay())
                  );
                }
              ),
              ElevatedButton(
                child:Text("Snakeway"),
                onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>SnakeWayPlay())
                  );
                }
              ),
            ],
          ),
        )
      );
  }
}

