

import 'package:bento/constants.dart';
import 'package:bento/cubit/cubit.dart';
import 'package:bento/cubit/status.dart';
import 'package:bento/layouts/screens/recipes.dart';
import 'package:bento/layouts/screens/substitutions.dart';
import 'package:bento/layouts/screens/vlog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ALLalgeric.dart';
import '../alter.dart';
import 'homepage.dart';

class TheMainHomePage extends StatefulWidget {
  const TheMainHomePage({Key? key}) : super(key: key);

  @override
  State<TheMainHomePage> createState() => _TheMainHomePageState();
}

class _TheMainHomePageState extends State<TheMainHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> Items=[
      Image.asset(
      'assets/images/food2.jpg',
      height: 200,
    ),
      Image.asset(
        'assets/images/food3.jpg',
        height: 200,
      ),
      Image.asset(
        'assets/images/food5.jpg',
        height: 200,
      ),];
    return

       BlocConsumer<BentoCubit,BentoStates>(
         listener: (context,states){},
         builder: (context,states){
           return Padding(
             padding: const EdgeInsets.only(left: 10.0,right: 10.0),
             child: SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:  [
                   const Text("Hello ,All ",
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 30.0,


                     ),),
                   const Text("What would like to eat",
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 35.0,),
                   ),
                   TextFormField(
                     decoration: const InputDecoration(
                       border: OutlineInputBorder(),
                       hintText: "search your meal",
                       prefixIcon: Icon(Icons.search,color: Color(0xffE5383B),),
                       contentPadding: EdgeInsets.zero,


                     ),
                   ),
                   const SizedBox(height: 10,),
                   CarouselSlider(items: Items, options:CarouselOptions(
                     autoPlay: true,
                     autoPlayInterval: const Duration(seconds: 4),
                   )
                   ),
                   const SizedBox(height: 10,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [  TextButton(onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder:
                           (context)=>All()));
                     }, child: const Text(
                       "Our Recipes",
                       style: TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                         fontSize: 20.0,


                       ),),),
                     const SizedBox(height: 10,),
                     Container(
                       height: 200,
                       child:ListView.separated(
                         itemBuilder: (context,index)=>defultItem(recipies[index]),
                         separatorBuilder:(context,index)=>  Container(
                           width:5 ,


                         ), itemCount:recipies.length,
                         scrollDirection: Axis.horizontal,
                         ),

                     ),
                     const SizedBox(height: 10,),],),

               TextButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder:
                     (context)=>Substitutions()));
               }, child: const Text("More about allergies ",
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 20.0,
                       color: Colors.black
                     ),),),
                   const SizedBox(height: 10,),
                   Container(
                     height: 100,
                     width: double.infinity,

                     child:ListView.separated(
                       itemBuilder: (context,index)=> BentoCubit.get(context).AlternativeItem(),
                       separatorBuilder:(context,index)=>  Container(
                         width:10 ,


                       ), itemCount: 10,
                       scrollDirection: Axis.horizontal,),

                   ),
                   SizedBox(height: 10,),
               TextButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder:
                     (context)=>blog()));
               }, child:
                   const Text("Our Blogs ",
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 20.0,
                       color: Colors.black


                     ),),),
                   SizedBox(height: 10,),
               Row(
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
               )
                  /* Container(
                     height: 300,

                     child: ListView.separated
                       (
                       itemBuilder: (context,index)=>Bolg(blogs[index]),
                       separatorBuilder: (context,index)=>Container(
                         width:10  ,
                         color: Colors.grey,
                         height: 1,
                       ),
                       itemCount: 4,


                     ),
                   ),*/




                      /*Container(

                        color: Colors.yellow,
                        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                         children:  [
                            Padding(
                             padding: EdgeInsets.all(0.0),

                               child: Expanded(
                                 child: Container(

                                   color: Colors.red,
                                   height: 200,
                                   width: 150,
                                   child: Text("Lorem ibhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhjjlhhhhh"
                                       "jjjjjjjjjj"


                                     ,maxLines: 4,
                                     overflow: TextOverflow.ellipsis,
                                   ),
                                 ),
                               ),

                           ),
                           SizedBox(width: 10,),

                           Expanded(
                             child: Image.asset("assets/images/food2.jpg",
                               width: 150,
                               height: 200,
                             ),
                           ),



                         ],
                     ),
                      ),*/




                 ],

               ),
             ),
           );
         },

       );

  }
}
