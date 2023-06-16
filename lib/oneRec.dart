import 'package:bento/cubit/cubit.dart';
import 'package:bento/cubit/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';

class oneRec extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BentoCubit,BentoStates>(
      listener: (context,states){},
      builder: (context,states){
        return
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            color: Colors.white,
            child:
            Center(
              child: SingleChildScrollView(
                child: Container(
                  height: 450,



                  child:ListView.separated(
                    itemBuilder: (context,index)=>Recipe(recipies[index],context),
                    separatorBuilder:(context,index)=>  Container(
                      width:5 ,


                    ), itemCount:recipies.length,

                  ),

                ),
              ),
            ),

          ),
        );
      },

    );
  }
}

