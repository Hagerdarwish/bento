import 'package:bento/layouts/homepage.dart';
import 'package:bento/layouts/signup.dart';
import 'package:flutter/material.dart';

class SecPage extends StatelessWidget {
  const SecPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff283c3a),


        body: Stack(

          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bento.jpeg'),
                    fit: BoxFit.contain

                ),
              ),

            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Material(

                elevation: 400,
                borderRadius: BorderRadius.only(topLeft:Radius.circular(120)),

                child: Container(
                  decoration: BoxDecoration(
                    boxShadow:[ BoxShadow(
                        color: Colors.grey,
                        offset:Offset (0,10),
                        blurRadius: 50.0

                    ),],
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(120),
                    ),

                    color: Color(0xFFedeae1),
                  ),
                  width: double.infinity,
                  height: 280,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      const Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Center(
                          child: Text(" There are many resources and treatments available to"
                              " help you manage your symptoms and enjoy life to the fullest. . ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                              color: Color(0xff283c3a)
                            ),),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: IconButton(onPressed:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>homePage()));

                            }, icon: Icon(Icons.navigate_next,size: 100,),)
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

          ],
        )
    );
  }
}