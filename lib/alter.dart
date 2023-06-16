

import 'package:bento/layouts/screens/recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';
import 'cubit/cubit.dart';
import 'cubit/status.dart';

class alter extends StatelessWidget {
  const alter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>BentoCubit()..createDatabase(),
      child: BlocConsumer<BentoCubit,BentoStates>(
        listener:(context,states){} ,
        builder: (context,states){ return Scaffold(
          appBar: AppBar(),
          body:Column(
            children: [
              TextButton(onPressed: (){

                BentoCubit.get(context).insertDatabase();
              }, child: Text("insert")),
              IconButton(onPressed: (){
                BentoCubit.get(context).getDatabase(BentoCubit.get(context).database);

              }, icon: Icon(Icons.add,size: 30,),

              ),
              Container(
                height: 300,
                child:ListView.separated
                  (physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,index)=>defultRecipesItem3(Lactuse[index],context),
                  separatorBuilder: (context,index)=>Container(
                    width:10  ,
                    color: Colors.grey,
                    height: 1,
                  ),
                  itemCount: Lactuse.length,


                ),
                /*ListView.separated(itemBuilder: (context,index)=>defultItem(BentoCubit.get(context).recipies[index]),
                    separatorBuilder:(context,index)=> Container(
                  width:5 ,


                ), itemCount: BentoCubit.get(context).recipies.length),*/
              )
            ],
          ),
        );},

      ),
    );
  }
}
