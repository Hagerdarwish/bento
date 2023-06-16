import 'package:bento/layouts/signup.dart';
import 'package:bento/layouts/screens/vlog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../cubit/cubit.dart';
import '../../cubit/status.dart';

class Recipes extends StatelessWidget {
  const Recipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BentoCubit,BentoStates>(
      listener: (context, index) {},
      builder: (context, index) {


        return

             Scaffold(
               appBar: AppBar(),
               body: SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [  TextButton(onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder:
                           (context)=>Recipes()));
                     }, child: const Text("Our Recipes ",

                       style: TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                         fontSize: 20.0,


                       ),),),
                       const SizedBox(height: 10,),
                       Center(
                         child: SingleChildScrollView(
                           child: Expanded(
                             child: Container(
                               height: 600,
                               child:ListView.separated(
                                 itemBuilder: (context,index)=>
                                   Recipe(Meat[index],context)

                                 ,
                                 separatorBuilder:(context,index)=>  Container(
                                   width:5 ,


                                 ), itemCount:Meat.length,

                               ),

                             ),
                           ),
                         ),
                       ),
                       const SizedBox(height: 10,),],),
                 ),
               ),
             );


      }

      );



  }
}
