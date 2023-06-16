import 'package:bento/layouts/recpies/gluten.dart';
import 'package:bento/layouts/recpies/lactose.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'layouts/recpies/meat.dart';
import 'layouts/screens/recipes.dart';

class All extends StatelessWidget {
  const All({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:
                    (context)=>glutens()));
              },
              child: Container(

                decoration: BoxDecoration( color: Colors.red,
                    image:DecorationImage(
                        image: AssetImage("assets/images/woat.png"),
                        fit: BoxFit.fill
                    )

                ),
                height: 150,

              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:
                    (context)=>glutens()));
              },
              child: Container(
                decoration: BoxDecoration( color: Colors.red,
                    image:DecorationImage(
                        image: AssetImage("assets/images/wegg.jpg"),
                        fit: BoxFit.fill
                    )

                ),
                height: 150,

              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:
                    (context)=>lactoses()));
              },
              child: Container(

                decoration: BoxDecoration( color: Colors.red,
                    image:DecorationImage(
                        image: AssetImage("assets/images/milko.jpg"),
                        fit: BoxFit.fill
                    )

                ),
                height: 150,

              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:
                    (context)=>glutens()));
              },
              child: Container(
                decoration: const BoxDecoration( color: Colors.red,
                    image:DecorationImage(
                        image: AssetImage("assets/images/nut.jpg"),
                        fit: BoxFit.fill
                    )

                ),
                height: 150,


              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>meats()));

              },
              child: Container(

                decoration: const BoxDecoration( color: Colors.red,
                    image:DecorationImage(
                        image: AssetImage("assets/images/meet.jpg"),
                        fit: BoxFit.fill
                    )

                ),
                height: 150,

              ),
            ),
            SizedBox(height: 10,),
            Container(

              decoration: BoxDecoration( color: Colors.red,
                  image:DecorationImage(
                      image: AssetImage("assets/images/wsoy.jpg"),
                      fit: BoxFit.fill
                  )

              ),
              height: 150,

            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
