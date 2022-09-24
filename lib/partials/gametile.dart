import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class Gametile extends StatelessWidget{

  Gametile({
    this.screen,
    this.image,
    this.title,
    this.color,
    this.text,
    this.buttonColor
  });

  var screen, image, title, color , text, buttonColor;



  @override
  Widget build(BuildContext context){
    var screenWidth=MediaQuery.of(context).size.width;
    return Container(
                margin:const EdgeInsets.only(
                  left:62,
                  right:62,
                  top:20
                ),
                width:screenWidth,
                height:screenWidth/6,
                decoration:BoxDecoration(
                  image: DecorationImage(image: AssetImage(image), opacity:1, scale:0.5),
                  borderRadius:BorderRadius.circular(20),
                  border:Border.all(
                    width:5,
                    color:buttonColor
                  )
                ),
                child:InkWell(
                  onTap:(){
                    showModalBottomSheet<void>(
                              context:context,
                              builder:(BuildContext context){
                                return Container(
                                  height:screenWidth,
                                  width:screenWidth,
                                  color:color,
                                  child:Column(
                                    mainAxisAlignment:MainAxisAlignment.center,
                                    children:[
                                      Container(
                                        padding:EdgeInsets.all(20),
                                        margin:EdgeInsets.all(20),
                                        height:screenWidth/2.2,
                                        width:screenWidth,
                                        decoration:BoxDecoration(
                                          color:Colors.white,
                                          borderRadius:BorderRadius.circular(15)
                                        ),
                                        child:Text(text,
                                        style:TextStyle(
                                          fontSize:19
                                        ))
                                      ),
                                        Container(
                                            margin:EdgeInsets.all(20),
                                            width:screenWidth,
                                            height:screenWidth/5.5,
                                            child:ElevatedButton(
                                            style:ButtonStyle(
                                              backgroundColor:MaterialStateProperty.all(buttonColor)
                                            ),
                                            child:Text("Play", style:TextStyle(
                                              fontSize:20
                                            )),
                                            onPressed:(){
                                              Navigator.pop(context);
                                              Navigator.push(
                                              context,
                                              MaterialPageRoute(builder:(context)=>screen)
                                              );
                                            }
                                          )
                                          )
                                    ]
                                  )
                                );
                              }
                            );
                  }, 
                   child: Row(
                    children:[
                      Expanded(
                        child:Container(
                          margin:const EdgeInsets.only(left: 20),
                          child:StrokeText(
                          strokeWidth: 2,
                          text:title, 
                          textStyle:TextStyle(
                          fontFamily:"Tahoma",
                          fontWeight:FontWeight.bold,
                          color:color,
                          fontSize:16,
                        ))
                        )
                      ),
                      Container(
                        margin:EdgeInsets.only(right: 5),
                        child:Icon(Icons.arrow_drop_down, size:55, color:buttonColor)
                      )
                    ]
                  ),
                )
              );
  }
}