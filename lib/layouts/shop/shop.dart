import 'package:flutter/material.dart';

class shop extends StatelessWidget {
  const shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration( color: Colors.red,
                          image:DecorationImage(
                              image: AssetImage("assets/images/juh.png"),
                              fit: BoxFit.fill
                          )

                      ),
                      height:170,
                      width: 300,

                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height:170,
                      width: 300,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height:170,
                      width: 300,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height:170,
                      width: 300,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height:170,
                      width: 300,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height:170,
                      width: 300,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
