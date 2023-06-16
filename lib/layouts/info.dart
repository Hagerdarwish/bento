import 'package:flutter/material.dart';
class info extends StatelessWidget {
  const info ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Item1',
      'Item2',
      'Item3',
      'Item4',
    ];
    return Scaffold(

      body: Container(
        color:  const Color(0xFFf2e7bf ),
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
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text("Are You Signing up to BENTO For",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        RadioListTile(
                          title: const Text("Yourself"),
                          value: "Yourself",

                          onChanged: (value){

                          }, groupValue: '',
                        ),

                        RadioListTile(
                          title: const Text("Someone else"),
                          value: "Someone",

                          onChanged: (value){

                          }, groupValue: '',
                        ),
                       const SizedBox(height: 20,),
                        const Text("Are You Signing up to BENTO For",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        RadioListTile(
                          title: const Text("Allergy"),
                          value: "Allergy",

                          onChanged: (value){

                          }, groupValue: '',
                        ),

                        RadioListTile(
                          title: const Text("Chronic Illness"),
                          value: "Chronic Illness",

                          onChanged: (value){

                          }, groupValue: '',
                        ),
                        RadioListTile(
                          title: const Text("None of the above"),
                          value: "none",

                          onChanged: (value){

                          }, groupValue: '',
                        ),
                        Row(
                          children:  [
                            Text("Type of Illness/Allergy",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            SizedBox(
                              width: 10,
                            ),

                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,

                        decoration: const InputDecoration(


                        )
                      ),
                    )

                                //border: OutlineInputBorder(),
                              ]),

                        SizedBox(height: 20,),
                        ElevatedButton(onPressed: (){
                        },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFae0000),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                            child:
                            Container(
                              width: double.infinity,
                              child: const Center(
                                child: Text(
                                    "Continue",
                                    style:TextStyle(
                                      color: Colors.white,
                                    )
                                ),
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
