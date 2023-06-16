import 'package:bento/cubit/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';

class MealPlan extends StatelessWidget {
  const MealPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 500,
          width: 500,
          color: Colors.red,
          child:ListView.separated(
            itemBuilder: (context,index)=> Padding(

              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: 200,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffF5F3F4),

                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, //New
                        blurRadius: 25.0,
                        offset: Offset(0, 1))
                  ], ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset("assets/images/food2.jpg",
                        width: 150,
                        height: 100,

                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text("Dinner",style:TextStyle(fontSize: 15,color:Color(0xffff4a52),),),
                    const SizedBox(height: 5,),
                    const Text("Teco Teco",style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    const Text("blah blahh",style:TextStyle(fontSize: 20,),),

                  ],
                ),
              ),
            ),
            separatorBuilder:(context,index)=>  Container(
              width:10 ,


            ), itemCount: 10,scrollDirection: Axis.horizontal,),
        /*Column(

          children: [
            ListView.separated(
              itemBuilder: (context,index)=> Padding(

                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffF5F3F4),

                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey, //New
                          blurRadius: 25.0,
                          offset: Offset(0, 1))
                    ], ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset("assets/images/food2.jpg",
                          width: 150,
                          height: 100,

                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Text("Dinner",style:TextStyle(fontSize: 15,color:Color(0xffff4a52),),),
                      const SizedBox(height: 5,),
                      const Text("Teco Teco",style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 5,),
                      const Text("blah blahh",style:TextStyle(fontSize: 20,),),

                    ],
                  ),
                ),
              ),
              separatorBuilder:(context,index)=>  Container(
                width:10 ,


              ), itemCount: 10,scrollDirection: Axis.horizontal,),
          ],
        ),*/
      ),

    );
  }
}
