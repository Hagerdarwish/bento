

import 'package:bento/cubit/cubit.dart';
import 'package:bento/layouts/screens/meal_plan.dart';
import 'package:bento/layouts/screens/recipes.dart';
import 'package:bento/layouts/screens/substitutions.dart';
import 'package:bento/layouts/screens/vlog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';
import '../constants.dart';
import '../cubit/status.dart';
import 'screens/community.dart';

class homePage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>BentoCubit()..createDatabase(),
      child: BlocConsumer<BentoCubit,BentoStates>(
        listener: (context,states){},
        builder: (context,states){
          return
          Scaffold(
            appBar:AppBar(

              title:const Text("BENTO",style: TextStyle(color: Color(0xffE5383B)),),
            ),
            body: BentoCubit.get(context).screens[BentoCubit.get(context).currentIndex] ,
            bottomNavigationBar:
            BottomNavigationBar(
              currentIndex: BentoCubit.get(context).currentIndex,
              items:BentoCubit.get(context).bottomNavItem,
              onTap: (index){
                BentoCubit.get(context).changeNavBar(index);
                print(index);
              },
            ),
            drawer:Padding(

              padding: const EdgeInsets.only(top: 20.0),
              child: Drawer(
                width: MediaQuery.of(context).size.width*0.70,

                child: ListView( padding: EdgeInsets.zero,

                  children: [

                    ListTile(
                      leading:const Icon(Icons.people_alt_outlined,color: Colors.black,) ,
                      title: const Text("Community",style: TextStyle(color: Color(0xffE5383B)),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>blog()));
                      },
                    ),
                    ListTile(
                      leading:const Icon(Icons.restaurant_menu ,color: Colors.black,) ,
                      title: const Text("Recipes",style: TextStyle(color: Color(0xffE5383B)),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Recipes()));
                      },
                    ),
                    ListTile(
                      leading:const Icon(Icons.book_rounded,color: Colors.black,) ,
                      title: const Text("products",style: TextStyle(color: Color(0xffE5383B)),),
                      onTap: (){},
                    ),
                    ListTile(
                      leading:const Icon(Icons.swipe_left_outlined,color: Colors.black,) ,
                      title: const Text("Substitutions",style: TextStyle(color: Color(0xffE5383B)),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Substitutions()));
                      },
                    ),
                  ],
                ),
              ),
            ) ,

          );
        },

      ),
    );
  }
}
