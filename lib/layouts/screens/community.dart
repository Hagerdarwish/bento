import 'package:bento/layouts/screens/vlog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/status.dart';

class Community extends StatelessWidget {
  const Community({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const blog()));
            },
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                  decoration:  BoxDecoration(
                      color: Color(0xff293b3b),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Color(0xff293b3b))
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,

                      children: [


                        const Center(child: Text("Motivated stories",
                          style:
                          TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        )
                      ],
                    ),
                  )
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const blog()));
            },
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(




                  decoration:  BoxDecoration(
                      color: Color(0xff293b3b),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Color(0xff293b3b))
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,

                      children: [


                        const Center(child: Text("Resources",
                          style:
                          TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        )
                      ],
                    ),
                  )
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const blog()));
            },
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(




                  decoration:  BoxDecoration(
                    color: Color(0xff293b3b),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Color(0xff293b3b))
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,

                      children: [


                        const Center(child: Text("Reviews",
                          style:
                          TextStyle(
                            color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        )
                      ],
                    ),
                  )
              ),
            ),
          ),
        ],

      ),
    );
  }

  }

