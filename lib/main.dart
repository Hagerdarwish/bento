import 'package:bento/constants.dart';
import 'package:bento/cubit/cubit.dart';
import 'package:bento/cubit/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ALLalgeric.dart';
import 'layouts/TheMainHomePage.dart';
import 'layouts/firstScreen.dart';
import 'layouts/homepage.dart';
import 'layouts/recpies/meat.dart';
import 'layouts/screens/meal_plan.dart';
import 'layouts/screens/recipes.dart';
import 'layouts/screens/vlog.dart';
import 'layouts/signup.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the databaseFactory


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>BentoCubit(),
      child: BlocConsumer<BentoCubit,BentoStates>(
        listener: (context,states){},
        builder: (context,states){
          return  MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                      color: Colors.white,
                      iconTheme: IconThemeData(
                          color: Color(0xffE5383B)
                      ),
                      elevation: 0
                  ),
                  scaffoldBackgroundColor:Color(0xffFFFFFF),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor:Color(0xffc1c7c3) ,
                      unselectedItemColor: Colors.grey,
                      showSelectedLabels: true,
                      backgroundColor: Color(0xffE5383B)
                  ),
                  drawerTheme: const DrawerThemeData(
                      backgroundColor: Color(0xffD3D3D3)


                  )
              ),
              home:homePage()
          );
        },

      ),
    );
  }
}


