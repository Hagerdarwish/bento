import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(title: Text("Update Pofile"),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
             const Center(
               child: Text(" Edit Your profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                )
                ,),
             ),
            const SizedBox(height: 30.0,),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(" Username",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                    ,),
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 5,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder()

                      ),
                    )
                )




              ],
            ),
            const SizedBox(height: 15.0,),
            Row(

              children: [
                Expanded(
                  flex: 2,
                  child: Text(" E-mail",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                    ,),
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 5,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder()

                      ),
                    )
                )




              ],
            ),
            const SizedBox(height: 15.0,),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(" Name",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                    ,),
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 5,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder()

                      ),
                    )
                )





              ],
            ),
            const SizedBox(height: 15.0,),


          ],
        ),
      ),


    );
  }
}
