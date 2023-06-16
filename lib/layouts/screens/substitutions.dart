import 'package:bento/layouts/screens/recipes.dart';
import 'package:flutter/material.dart';

import '../../cubit/cubit.dart';
import '../homepage.dart';

class Substitutions extends StatelessWidget {
  const Substitutions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GestureDetector(
        onTap:(){

         // Navigator.push(context, MaterialPageRoute(builder: (context)=>homePage(Index: 2,)));


        } ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ TextButton(onPressed: (){
          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>homePage()));
          }, child: const Text("Our Recipes ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,


            ),),),

            const SizedBox(height: 10,),
            Container(
              height: 200,
              width: double.infinity,

              child:ListView.separated(
                itemBuilder: (context,index)=> BentoCubit.get(context).RecipesItem2(),
                separatorBuilder:(context,index)=>  Container(
                  width:5 ,


                ), itemCount: 10,scrollDirection: Axis.horizontal,),

            ),
            const SizedBox(height: 10,),],),
      ),
    );
  }
}
