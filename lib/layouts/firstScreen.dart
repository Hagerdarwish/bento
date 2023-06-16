import 'package:bento/cubit/cubit.dart';
import 'package:bento/layouts/homepage.dart';
import 'package:bento/layouts/signup.dart';
import 'package:bento/layouts/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/status.dart';

class FirstPage extends StatelessWidget {
  const FirstPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>BentoCubit()..createDatabase(),
      child: BlocConsumer<BentoCubit,BentoStates>(
        listener: (context,states){},
        builder: (context,states){
          return
          Scaffold(


            body: Stack(

              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/food5.jpg'),
                        fit: BoxFit.cover

                    ),
                  ),

                ),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Material(

                    elevation: 400,
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(120)),

                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow:[ BoxShadow(
                            color: Colors.grey,
                            offset:Offset (0,10),
                            blurRadius: 50.0

                        ),],
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(120),
                        ),

                        color: Color(0xFFeacba1),
                      ),
                      width: double.infinity,
                      height: 300,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children:  [
                          const Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Center(
                              child: Text("Living with allergies can be challenging, but it's important "
                                  "to remember that you are not alone. ",style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: IconButton(onPressed:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>homePage()));

                                }, icon: Icon(Icons.circle,size: 70,),)
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            )
        );},

      ),
    );
  }
}
/*Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          const Text("BENTO",style: TextStyle(fontSize: 20),),
          Container(

            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Eating shoud be easy",style: TextStyle(fontSize: 15),),
                      const SizedBox(height: 25,),
                      const Text("BENTO is the first web application in the Middle East/North Africa",style: TextStyle(fontSize: 15),),
                      const SizedBox(height: 15,),
                      const Text("reigon to serve people with food allergies. Deciding what to eat should never be stressful, not even in the slightest.",style: TextStyle(fontSize: 15),),
                      const SizedBox(height: 15,),
                      const Text("We provide services to those who struggle with food allergies in hopes to make their lives easy.",style: TextStyle(fontSize: 15),),
                      const SizedBox(height: 25,),
                      const Text("Join BENTO below",style: TextStyle(fontSize: 15),),
                      const SizedBox(height: 35,),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>signUp() )
                        );
                      },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFae0000),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                        child:
                        Container(
                          width: double.infinity,
                          child: const Center(
                            child: Text(
                                "Get Started",
                                style:TextStyle(
                                  color: Colors.white,
                                )
                            ),
                          ),
                        )
                      )
                    ],
                  ),
                ),
              ),
            ),
          )

        ],
      ),*/