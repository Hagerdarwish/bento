import 'package:bento/constants.dart';
import 'package:bento/cubit/cubit.dart';
import 'package:bento/cubit/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class blog extends StatelessWidget {
  const blog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<BentoCubit,BentoStates>(
      listener:(context,states){} ,
      builder: (context,states){ return Scaffold(
        appBar: AppBar(),
        body:SingleChildScrollView(
          child: Column(
            children: [

              Container(
                height:600,
                child:ListView.separated
                  (physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,index)=> Row(
                    children: [
                      Expanded(
                        child: Container(

                          height: 120,
                          width: 150,
                          decoration: const BoxDecoration(

                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                                spreadRadius: 1.0,)
                            ],
                          ),
                          child: Image.asset("assets/images/food2.jpg",
                            fit: BoxFit.fill,
                            width: 150,
                            height: 200,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(child: Text("Allergy occurs when a person"
                          " reacts to substances in the environment that are harmless to "
                          "most people. These substances are known as allergens and are found in dust mites,"
                          " pets, pollen, insects, ticks, moulds,"
                          " foods and some medications. Atopy is the genetic tendency "
                          "to develop allergic diseases",maxLines: 5,)),
                      SizedBox(
                        height: 10,
                      )


                    ],
                  ),
                  separatorBuilder: (context,index)=>Container(
                    width:20  ,
                    color: Colors.grey,
                    height: 1,
                  ),
                  itemCount: 5,


                ),
                /*ListView.separated(itemBuilder: (context,index)=>defultItem(BentoCubit.get(context).recipies[index]),
                    separatorBuilder:(context,index)=> Container(
                  width:5 ,


                ), itemCount: BentoCubit.get(context).recipies.length),*/
              )
            ],
          ),
        ),
      );},

    );
  }
}


/*ListView.separated(
itemBuilder: (context,index)=> defultRecipesItem3(BentoCubit.get(context).recipies[index]),
separatorBuilder:(context,index)=>
Container(
width:5 ,


), itemCount: BentoCubit.get(context).recipies.length,
scrollDirection: Axis.horizontal,),*/
