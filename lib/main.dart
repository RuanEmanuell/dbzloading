import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import "package:flame/game.dart";
<<<<<<< HEAD


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
              ElevatedButton(
                child:Text("Gotenks"),
                onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>GotenksPlay())
                  );
                }
              ),
            ],
          ),
        )
      );
  }
}

=======


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

>>>>>>> a99761a9d20405a031f50f251ba4c9419df0ff3f
