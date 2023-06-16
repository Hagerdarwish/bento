import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../cubit/cubit.dart';
import '../../cubit/status.dart';
import '../screens/recipes.dart';

class lactoses extends StatelessWidget {
  const lactoses({Key? key}) : super(key: key);

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
                          child: SingleChildScrollView(
                            child: Container(
                              height: 600,
                              child:ListView.separated(
                                itemBuilder: (context,index)=>
                                    Recipe(Lactuse[index],context)

                                ,
                                separatorBuilder:(context,index)=>  Container(
                                  width:5 ,


                                ), itemCount:Lactuse.length,

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