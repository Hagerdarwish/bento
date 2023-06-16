import 'package:bento/layouts/signup.dart';
import 'package:bento/oneRec.dart';
import 'package:flutter/material.dart';

import 'cubit/cubit.dart';
List<Map> recipies=[];
List<Map> sign=[];
List<Map> blogs = [];
List<Map> Gluten=[];
List<Map> Lactuse=[];
List<Map> Egg=[];
List<Map> Nut=[];
List<Map> Meat=[];
List<Map> soy=[];


showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = MaterialButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog

  AlertDialog alert = AlertDialog(
    title: Text("Simple Alert"),
    content: Container(
      child: Text('$recipies[0]'),
    ),

  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
Widget Recipe(Map model,context)=>
     Padding(

    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xffF5F3F4),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 1.0,
            spreadRadius: 1.0,)
        ], ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

                  Center(
                    child: Image.asset("${model['img']}",
                      fit: BoxFit.contain,

                      width: 200,
                      height: 119,


                    ),
                  ),



              const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    Text("${model['recipe']}",style:TextStyle(fontSize: 10,color: Colors.black),),

                    Text("${model['type']}",style:TextStyle(fontSize: 10,color: Colors.grey),),
                    IconButton(
                      onPressed: () {
                        BentoCubit.get(context).readmore();
                      },
                      icon: Icon(
                          BentoCubit.get(context).readMore ? Icons.arrow_forward_ios:Icons.expand_circle_down_outlined
                      ),
                      // Text(BentoCubit.get(context).readMore ? "Read less" : "Read more"),
                    ),




                    //Text("${model['recipe']}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),

                  ],
                ),
              )


            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "    \n${model['Para']}",

              textAlign: TextAlign.start,
              maxLines: BentoCubit.get(context).readMore ? 20 :1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );


Widget defultItem(Map model)=>

    Padding(

      padding: const EdgeInsets.all(10.0),
      child: Container(

        width: 200,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffF5F3F4),

          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              blurRadius: 1.0,
              spreadRadius: 1.0,)
          ], ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset("${model['img']}",
                width: 150,
                height: 100,

              ),
            ),
            const SizedBox(height: 10,),
             Text("${model['recipe']}",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            const SizedBox(height: 5,),
             Text("${model['type']}",style:TextStyle(fontSize: 15,color:Color(0xffff4a52),),),

          ],
        ),
      ),
    );
Widget defultRecipesItem3(Map model,context){
  return   Padding(

    padding: const EdgeInsets.all(10.0),
    child: Container(



      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("${model['img']}",
                fit: BoxFit.fill,

                width: 120,
                height: 100,


              ),
              const SizedBox(height: 10,)
              ,

               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text("${model["recipe"]}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                       const SizedBox(height: 5,),
                       Text("${model["type"]}",style:TextStyle(fontSize: 12,color: Color(0xffE5383B)),),
                     ],
                   ),
                   IconButton(
                     onPressed: () {
                       BentoCubit.get(context).readmore();
                     },
                     icon: Icon(
                         BentoCubit.get(context).readMore ? Icons.arrow_forward_ios:Icons.expand_circle_down_outlined
                     ),
                     // Text(BentoCubit.get(context).readMore ? "Read less" : "Read more"),
                   ),


                 ],
               ),


            ],
          ),
          Expanded(
            child: Container(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "    \n${model['Para']}",

                  textAlign: TextAlign.start,
                  maxLines: BentoCubit.get(context).readMore ? 20 :1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),

        ],
      ),
    ),
  );

}
Widget Bolg(Map model)=> Row(
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
    Expanded(child: Text("${model["paragraph"]}",maxLines: 5,)),


  ],
);
String ?h;
String? ggg(){

  recipies.forEach((element) {
    return  h=element["status"];

  });
}