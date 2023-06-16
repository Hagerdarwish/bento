import 'package:bento/layouts/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';
import '../cubit/cubit.dart';
import '../cubit/status.dart';
import 'login.dart';

class signUp extends StatelessWidget {
  signUp({Key? key}) : super(key: key);
  var controllerName=TextEditingController() ;
  var controllerEmail=TextEditingController() ;
  var controllerPassword=TextEditingController() ;
  var controllerCpass=TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>BentoCubit()..createDatabase(),
      child: BlocConsumer<BentoCubit,BentoStates>(
          listener: (context, index) {},
          builder: (context, index) {
            return Scaffold(

              body: SingleChildScrollView(
                child: Container(
                  color: const Color(0xFFf2e7bf),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(

                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    const Text("Create your account",
                                      style: TextStyle(fontSize: 20),),
                                    const SizedBox(
                                      height: 12.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0,
                                          right: 10.0,
                                          bottom: 5.0,
                                          top: 10),
                                      child: TextFormField(
                                        controller: controllerName ,
                                        keyboardType: TextInputType.visiblePassword,

                                        decoration: const InputDecoration(

                                          prefixIcon: Icon(
                                            Icons.person,
                                            color: Color(0xFFae0000),
                                          ),

                                          hintText: "Username",


                                          //border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0,
                                          right: 10.0,
                                          bottom: 5.0,
                                          top: 10),
                                      child: TextFormField(
                                        controller: controllerEmail,
                                        keyboardType: TextInputType.visiblePassword,

                                        decoration: const InputDecoration(

                                          prefixIcon: Icon(
                                            Icons.mail,
                                            color: Color(0xFFae0000),
                                          ),

                                          hintText: "E-mail",


                                          //border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0,
                                          right: 10.0,
                                          bottom: 5.0,
                                          top: 10),
                                      child: TextFormField(
                                        controller: controllerPassword,
                                        keyboardType: TextInputType.visiblePassword,

                                        decoration: const InputDecoration(

                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: Color(0xFFae0000),
                                          ),

                                          hintText: "Password",


                                          //border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0, bottom: 5.0),
                                      child: TextFormField(
                                        controller: controllerCpass,
                                        keyboardType: TextInputType.visiblePassword,
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.lock_clock,
                                            color: Color(0xFFae0000),
                                          ),

                                          hintText: "Confirm Password",

                                          //border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),


                                    ElevatedButton(onPressed: () {
                                      BentoCubit.get(context).insertDatabase2(
                                        name:controllerName.text,
                                        email:controllerEmail.text,
                                        password:controllerPassword.text,
                                        confrimpassword:controllerCpass.text,


                                      );
                                    },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFFae0000),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10)
                                          )
                                      ),
                                      child:
                                      Container(
                                        width: double.infinity,
                                        child: const Center(
                                          child: Text(
                                              "sign up",
                                              style: TextStyle(
                                                color: Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton(onPressed: (){
                                      //print(recipies);
                                      print(sign);
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>logins()));

                                    }, child: Text("press me"),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}


