import 'package:bento/cubit/status.dart';
import 'package:bento/layouts/screens/profile.dart';
import 'package:bento/layouts/screens/vlog.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../alter.dart';
import '../constants.dart';
import '../layouts/TheMainHomePage.dart';
import '../layouts/screens/community.dart';
import '../layouts/screens/meal_plan.dart';
import '../layouts/screens/recipes.dart';
import '../layouts/screens/substitutions.dart';
import '../network/DioHelper.dart';

class BentoCubit extends Cubit<BentoStates> {
  BentoCubit() :super(InitailState());

  static BentoCubit get(context) => BlocProvider.of(context);

  List<Map> recipies2 = [];
  List<Map> Lactuse2 = [];

  List screens =const [
      TheMainHomePage(),
    alter(),
    Community(),
    blog(),
     Recipes(),
    Substitutions(),
    MealPlan(),


  ];

  List<BottomNavigationBarItem> bottomNavItem = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: "Home"
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: "Setting"
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.call),
        label: "contact us "
    ),

  ];


  int currentIndex = 0;

  void changeNavBar(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  void screenItem(context) {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => profile()
        )
    );
    emit(ChangeDrawerState());
  }

  Widget RecipesItem() {
    return
      Padding(

        padding: const EdgeInsets.all(10.0),
        child: Container(

          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xffF5F3F4),

            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 2),
                blurRadius: 1.0,
                spreadRadius: 1.0,)
            ],),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset("assets/images/food2.jpg",
                  width: 150,
                  height: 100,

                ),
              ),
              const SizedBox(height: 10,),
              const Text("Teco Teco",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const SizedBox(height: 5,),
              const Text("Dinner",
                style: TextStyle(fontSize: 15, color: Color(0xffff4a52),),),

            ],
          ),
        ),
      );
  }

  Widget RecipesItem2() {
    return Padding(

      padding: const EdgeInsets.all(10.0),
      child: Container(


        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffF5F3F4),

          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              blurRadius: 1.0,
              spreadRadius: 1.0,)
          ],),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://i.pinimg.com/564x/a3/95/bf/a395bf418127235d1b8194bb738c2310.jpg",
              fit: BoxFit.fill,

              width: 120,
              height: 100,


            ),
            const SizedBox(height: 10,),
            const Text("Indian salad",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            const SizedBox(height: 5,),
            const Text("dinner",
              style: TextStyle(fontSize: 12, color: Color(0xffE5383B)),),

          ],
        ),
      ),
    );
  }
  bool readMore=false;
void readmore(){
  readMore=!readMore;
  emit(ReadmoreState());


}
  Widget RecipesItem3(Map model) {
    return Padding(

      padding: const EdgeInsets.all(10.0),
      child: Container(


        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://i.pinimg.com/564x/a3/95/bf/a395bf418127235d1b8194bb738c2310.jpg",
              fit: BoxFit.fill,

              width: 120,
              height: 100,


            ),
            const SizedBox(height: 10,),
            Text("${model['recipe']}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            const SizedBox(height: 5,),
            Text("${model['type']}",
              style: TextStyle(fontSize: 12, color: Color(0xffE5383B)),),

          ],
        ),
      ),
    );
  }

  Widget Recipe(Map model) {
    return Padding(

      padding: const EdgeInsets.all(10.0),
      child: Container(


        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffF5F3F4),

          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              blurRadius: 1.0,
              spreadRadius: 1.0,)
          ],),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://i.pinimg.com/564x/a3/95/bf/a395bf418127235d1b8194bb738c2310.jpg",
              fit: BoxFit.fill,

              width: 600,
              height: 200,


            ),
            const SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${model['recipe']}", style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text("${model['type']}",
                    style: TextStyle(fontSize: 10, color: Colors.grey),),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }

  Widget AlternativeItem() {
    return
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: const Color(0xffD3D3D3),
            borderRadius: BorderRadius.circular(20)
        ),
        child: const Icon(Icons.fastfood_outlined, size: 40,),

      );
  }

  Database? database;


  void createDatabase() async
  {
    database = await openDatabase(
      'bento9.db',
      version: 1,
      onCreate:
          (database, version) {
        print("database is created");
        database.execute(
            'CREATE TABLE Test (id INTEGER PRIMARY KEY,'
                'recipe TEXT,'
                'type TEXT,'
                'FirstPara TEXT,'
                'Para TEXT,'
                'img TEXT '
                ',status Text)'
        ).catchError((error) {
          print("the database error is $error");
        });
        database.execute(
            'CREATE TABLE sign (signID INTEGER PRIMARY KEY, name TEXT, email TEXT ,age Text,region Text,password TEXT,confirmPass TEXT)'
        ).catchError((error) {
          print("the database2 error is $error");
        });
        database.execute(
            'CREATE TABLE blog (blogID INTEGER PRIMARY KEY, paragraph TEXT, img TEXT)'
        ).catchError((error) {
          print("the database2 error is $error");
        });
        database.execute(
            'CREATE TABLE shop (shopID INTEGER PRIMARY KEY, name TEXT ,img Text,info TEXT,x TEXT)'
        ).catchError((error) {
          print("the database2 error is $error");
        });
        database.execute(
            'CREATE TABLE signAdmin (signAID INTEGER PRIMARY KEY, name TEXT, email TEXT )'
        ).catchError((error) {
          print("the database2 error is $error");
        });
        database.execute(
            'CREATE TABLE signNut (signNID INTEGER PRIMARY KEY, name TEXT, email TEXT ,PROF Text,region Text,password TEXT,confirmPass TEXT)'
        ).catchError((error) {
          print("the database2 error is $error");
        });

      },
      onOpen: (database) {
        print("database is opened");
        getDatabase(database);
        getDatabase3(database);
      },

    ).then((value) => database = value);
    emit(CreateDatabaseState());
  }

  Future<void> getDatabase(database) async {
    database?.rawQuery(
        'select * from Test'
    ).then((value) {
      value.forEach((element) {
        if (element["status"] == "R") {
          recipies2.add(element);
          recipies = recipies2;
        }
        else if(element["status"]=="G"){
          Gluten.add(element);
        }
        else if(element["status"]=="L"){
          Lactuse2.add(element);
          Lactuse=Lactuse2;
        }
        else if(element["status"]=="E"){
          Egg.add(element);
        }
        else if(element["status"]=="N"){
          Nut.add(element);
        }
        else if(element["status"]=="M"){
          Meat.add(element);
        }
        else if(element["status"]=="S"){
          soy.add(element);
        }
      });
      print(value);
      database = value
      ;
    });
    print("data is getten");
    emit(GetDatabaseState());
  }
  Future<void> getDatabase3(database) async {
    database?.rawQuery(
        'select * from blog'
    ).then((value) {
      value.forEach((element) {
          blogs.add(element);
      });
      print(value);
      database = value
      ;
    });
    print("data is getten blog");
    emit(GetDatabaseState3());
  }
  Future<void> getDatabase2(database) async {
    database?.rawQuery("select * from sign").
    then((value) {
      value.forEach((element) {
        sign.add(element);
      });
    });
    print("database is getten2");
    emit(GetDatabaseState2());
  }



 void insertDatabase() async {
    await database?.transaction((txn) {
      txn.rawInsert(
          'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
              'VALUES("b chicken", "gluten free","To make air fryer popcorn chicken:",'
              '"1. Prepare the chicken by cutting it into bite-sized pieces and seasoning with spices.'
              '\n2. Set up a breading station with bowls of whisked eggs and a mixture of flour, breadcrumbs,'
              ' and spices.'
              '\n 3. Dip the chicken in the egg mixture, then coat it in the flour-breadcrumb mixture'
              '.\n 4. Cook the breaded chicken in a preheated air fryer at 400°F (200°C) for 10-12 minutes, flipping'
              ' halfway, until it reaches an internal temperature of 165°F (74°C). '
              'Serve hot with dipping sauces.","assets/images/l1.jpeg","R")'
      )
          .then((value) {print("$value inserted successfully");
      }).catchError((error) {print("erroe from insert $error"); });
      txn.rawInsert(
          'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
              'VALUES("Pancakes", "Gluten Free","To make a Pancakes!:",'
              '"1.In a mixing bowl, whisk together 1 cup of gluten-free oat flour, 1/2 cup of vanilla protein powder, 1teaspoon of baking powder, and 1/4 teaspoon of salt until well combined.. '
              '\n 2. In a separate bowl, whisk together 1 cup of unsweetened almond milk (or any dairy-free milk), 2 large eggs, 1 tablespoon of maple syrup (or honey), and 1 teaspoon of vanilla extract until well combined.'
              '\n 3. Pour the wet ingredients into the dry ingredients and stir until a smooth batter forms. Let the batter sit for a few minutes to thicken.'
              '\n 4. Preheat a non-stick skillet or griddle over medium heat. '
              '\n 5. Lightly grease the skillet with cooking spray or melted coconut oil.'
              '\n 6. Pour 1/4 cup of batter onto the skillet for each pancake. Cook until bubbles form on the surface, then flip and cook the other side until golden brown.'
              '\n 7. Repeat step 6 with the remaining batter, adjusting the heat if necessary, until all the pancakes are cooked.'
              '\n 8. Serve the protein pancakes warm with your favorite toppings such as fresh berries, sliced bananas, or a drizzle of nut butter.'


              ',"assets/images/G4.jpeg","R")'
      )
          .then((value) {print("$value inserted successfully");
      }).catchError((error) {print("erroe from insert $error"); });


      txn.rawInsert(
          'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
              'VALUES("Vegan meatloaf", "Meat Free","To make a Vegan meatloaf:",'
              '"1. Preheat the oven to 375°F (190°C) and line a loaf pan with parchment paper.'
              '\n2. In a large mixing bowl, combine cooked lentils, breadcrumbs, finely chopped vegetables '
              '(such asonions, carrots, and celery), minced garlic, tomato paste, soy sauce, ground flaxseed (as a binder),'
              ' and ablend of herbs and spices (such as thyme, rosemary, paprika, and black pepper).'
              '\n 3. Mix all the ingredients together until well combined.'
              '\n 4. Transfer the mixture into the prepared loaf pan and press it down firmly to form the meatloaf shape.'
              '\n 5. In a small bowl, whisk together ketchup, maple syrup (or another sweetener), and soy sauce (or tamari) to create a glaze'
              '.\n 6. Pour the glaze over the top of the meatloaf, spreading it evenly.\n7. Place the loaf pan in the preheated oven and bake for '
              'about 45-50 minutes, or until the meatloaf isfirm and the top is golden brown.\n 8. Remove the vegan meatloaf from the oven and let'
              ' it cool for a few minutes before slicing and serving.\n 9. Serve the vegan meatloaf with your favorite sides, such as mashed potatoes,'
              ' roasted vegetables, or aside salad","assets/images/M1.jpeg","R")'
      )
          .then((value) {print("$value inserted successfully");
      }).catchError((error) {print("erroe from insert $error"); });

      //---------------------------------------------------------------------------
      txn.rawInsert(
          'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
              'VALUES("Vegan meatloaf", "Meat Free","To make a Vegan meatloaf:",'
              '"1. Preheat the oven to 375°F (190°C) and line a loaf pan with parchment paper.'
              '\n2. In a large mixing bowl, combine cooked lentils, breadcrumbs, finely chopped vegetables '
              '(such asonions, carrots, and celery), minced garlic, tomato paste, soy sauce, ground flaxseed (as a binder),'
              ' and ablend of herbs and spices (such as thyme, rosemary, paprika, and black pepper).'
              '\n 3. Mix all the ingredients together until well combined.'
              '\n 4. Transfer the mixture into the prepared loaf pan and press it down firmly to form the meatloaf shape.'
              '\n 5. In a small bowl, whisk together ketchup, maple syrup (or another sweetener), and soy sauce (or tamari) to create a glaze'
              '.\n 6. Pour the glaze over the top of the meatloaf, spreading it evenly.\n7. Place the loaf pan in the preheated oven and bake for '
              'about 45-50 minutes, or until the meatloaf isfirm and the top is golden brown.\n 8. Remove the vegan meatloaf from the oven and let'
              ' it cool for a few minutes before slicing and serving.\n 9. Serve the vegan meatloaf with your favorite sides, such as mashed potatoes,'
              ' roasted vegetables, or aside salad","assets/images/M1.jpeg","M")'
      )
          .then((value) {print("$value inserted successfully");
      }).catchError((error) {print("erroe from insert $error"); });

      txn.rawInsert(
          'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
              'VALUES("vegan cheesecake cake,", "Meat Free","To make a vegan cheesecake cake,:",'
              '"1. Prepare the crust by combining the ingredients and pressing the mixture into the bottom of a springform pan.\n2. In a blender or food processor, blend the filling ingredients until smooth and creamy.\n 3. Pour the filling mixture over the prepared crust in the springform pan.\n4. Smooth out the top of the filling and tap the pan gently to remove any air bubbles.\n5. Place the cheesecake in the refrigerator and allow it to set for several hours or overnight.\n 6. Once the cheesecake is set, prepare the topping by blending or whisking together the ingredientsuntil well combined.\n 7. Spread the topping evenly over the chilled cheesecake.\n8. Return the cheesecake to the refrigerator and let it chill for an additional hour or until the topping is set.\n9. Prior to serving, garnish the cheesecake with optional toppings such as crushed nuts or a drizzle of '
              'maple syrup. \n10. Carefully remove the sides of the springform pan before slicing and serving."'
              ',"assets/images/M2.jpeg","M")'
      )
          .then((value) {print("$value inserted successfully");
      }).catchError((error) {print("erroe from insert $error"); });

      txn.rawInsert(
          'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
              'VALUES("Vegan pesto", "Meat Free","To make a Vegan pesto:",'
              '"1. In a food processor or blender, combine all the ingredients for the vegan pesto.'
              '\n 2. Blend or process the mixture until smooth and well combined, scraping down the sides as needed'
              '.\n 3. If the pesto is too thick, you can add more olive oil or a splash of water to achieve your desired consistency.'
              '\n 4. Taste the pesto and adjust the seasonings if needed. You can add more salt, pepper, or nutritionalyeast for extra flavor.'
              '\n 5. Once the pesto reaches your desired consistency and taste, transfer it to a jar or airtight container.'
              '\n6. Store the vegan pesto in the refrigerator until ready to use.'
              '\n  7. Serve the vegan pesto with pasta, as a spread on sandwiches or wraps, or as a dip for vegetables.'
              '\n 8. Enjoy the fresh and flavorful vegan pesto","assets/images/M3.jpeg","M")'
      )
          .then((value) {print("$value inserted successfully");
      }).catchError((error) {print("erroe from insert $error"); });

      txn.rawInsert(
          'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
              'VALUES("Vegan granola chips", "Meat Free","To make a Vegan granola chips:",'
              '"1. Preheat your oven to 325°F (165°C) and line a baking sheet with parchment paper. /n 2. In a large mixing bowl,'
              ' combine rolled oats, chopped nuts, seeds, and dried fruit./n 3. In a separate smaller bowl, whisk together melted coconut oil, '
              'maple syrup (or any other liquid sweetener), and vanilla extract./n 4. Pour the wet mixture over the dry ingredients and mix well until'
              ' everything is evenly coated./n  5. Spread the mixture in an even layer on the prepared baking sheet./n 6. Bake in the preheated oven '
              'for about 15-20 minutes, or until the granola is golden brown and crisp./n 7. Remove from the oven and let the granola cool completely'
              ' on the baking sheet. It will continue to crisp up as it cools./n 8. Once cooled, you can break the granola into smaller pieces or leave'
              ' it in larger clusters./n 9. Store the vegan granola chips in an airtight container at room temperature for up to a week."'


              ',"assets/images/M4.jpeg","M")'
      )
          .then((value) {print("$value inserted successfully");
      }).catchError((error) {print("erroe from insert $error"); });

      txn.rawInsert(
          'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
              'VALUES("Vegan baked oatmea", "Meat Free","To make a vegan baked oatmea!:",'
              '"1. Preheat your oven to a specified temperature (usually around 350°F/175°C) and lightly grease abaking dish.'
      '/n 2. In a blender, combine all the ingredients for the baked oatmeal. '
      'This typically includes rolled oats,plant-based milk (such as almond milk or oat milk),'
      ' sweetener (such as maple syrup or agave syrup), vanilla extract, and any desired flavorings or add-ins '
      '(such as cinnamon, nuts, or dried fruit)./n 3. Blend the ingredients until smooth and well combined. The consistency'
      ' should be thick but pourable.'
      '/n 4. Pour the blended oatmeal mixture into the greased baking dish, spreading it evenly.'
      '/n 5. If desired, you can add additional toppings on top, such as sliced fruit, nuts, or a sprinkle of cinnamon.'
      '/n  6. Place the baking dish in the preheated oven and bake for a specified amount of time (usually around 30-40 minutes),'
      ' or until the oatmeal is set and lightly golden on top./n 7. Remove the baked oatmealfrom the oven and let it cool for a few minutes before serving./n 8. Cut the baked oatmeal into individual portions and serve warm. You can enjoy it as is or add extra toppings like a drizzle of maple syrup or a dollop of plant-based yogurt"'


              ',"assets/images/M5.jpeg","M")'
      )
          .then((value) {print("$value inserted successfully");
      }).catchError((error) {print("erroe from insert $error"); });

      //-------------------------------------------------------------------------------------------------
      txn.rawInsert(
          'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
              'VALUES("Pancakes", "Gluten Free","To make a Pancakes!:",'
              '"1.In a mixing bowl, whisk together 1 cup of gluten-free oat flour, 1/2 cup of vanilla protein powder, 1teaspoon of baking powder, and 1/4 teaspoon of salt until well combined.. '
              '\n 2. In a separate bowl, whisk together 1 cup of unsweetened almond milk (or any dairy-free milk), 2 large eggs, 1 tablespoon of maple syrup (or honey), and 1 teaspoon of vanilla extract until well combined.'
              '\n 3. Pour the wet ingredients into the dry ingredients and stir until a smooth batter forms. Let the batter sit for a few minutes to thicken.'
              '\n 4. Preheat a non-stick skillet or griddle over medium heat. '
              '\n 5. Lightly grease the skillet with cooking spray or melted coconut oil.'
              '\n 6. Pour 1/4 cup of batter onto the skillet for each pancake. Cook until bubbles form on the surface, then flip and cook the other side until golden brown.'
              '\n 7. Repeat step 6 with the remaining batter, adjusting the heat if necessary, until all the pancakes are cooked.'
              '\n 8. Serve the protein pancakes warm with your favorite toppings such as fresh berries, sliced bananas, or a drizzle of nut butter.","assets/images/G4.jpeg","G")'
      )
          .then((value) {print("$value inserted successfully");
      }).catchError((error) {print("erroe from insert $error"); });




      txn.rawInsert(
          'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
              'VALUES("Muffin", "Gluten Free","To make a Muffin!:",'
              '"1.  In a large mixing bowl, combine gluten-free flour blend, granulated sugar, baking powder, baking soda,salt, poppy seeds, and lemon zest. '
              '\n 2.In a separate bowl, mix together lemon juice, almond milk, melted coconut oil, eggs, and vanilla extract.'
              '\n 3. Pour the wet ingredients into the dry ingredients and stir until just combined '
              '\n 4. Divide the batter evenly among the muffin cups, filling them about 3/4 full '
              '\n 5. Bake for 18-20 minutes, or until a toothpick inserted into the center comes out clean.'
              '\n 6.Let the muffins cool in the pan for a few minutes, then transfer to a wire rack to cool completely'
              '\n 7.In a small bowl, mix softened coconut butter, maple syrup, and lemon juice until smooth.'
              '\n 8.Once the muffins are cooled, drizzle or spread the coconut butter icing on top of each muffin","assets/images/G5.jpeg","G")'
      )
          .then((value) {print("$value inserted successfully");
      }).catchError((error) {print("erroe from insert $error"); });




      txn.rawInsert(
          'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
              'VALUES(" apple crisp", "Gluten Free","To make a Orange Apple Nrisp!:",'
              '"1.  Preheat your oven to 350°F (175°C) '
              '\n 2.In a large bowl, combine the sliced apples, lemon juice, granulated sugar, cinnamon, and nutmeg. Toss to coat the apples evenly with the mixture.'
              '\n 3.Transfer the apple mixture to a greased 9-inch baking dish, spreading it out in an even layer. '
              '\n 5. In a separate bowl, combine the gluten-free oats, gluten-free flour blend, and packed brown suger '
              '\n 6.Add the cold unsalted butter (or dairy-free alternative) to the bowl with the dry ingredients. Use your hands or a pastry cutter to mix the butter into the dry ingredients until the mixture resembles coarse crumbs '
              '\n 7.Sprinkle the crumb mixture evenly over the apples in the baking dish.'
              '\n 8.Place the baking dish in the preheated oven and bake for about 35-40 minutes, or until the topping is golden brown and the apples are tender'
              '\n 7.Serve the gluten-free apple crisp warm, optionally with a scoop of vanilla ice cream or whippedcream on top..","assets/images/G3.jpeg","G")'
      )
          .then((value) {print("$value inserted successfully");
      }).catchError((error) {print("erroe from insert $error"); });





      txn.rawInsert(
          'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
              'VALUES("Orange Coffee Cake", "Gluten Free","To make a Orange Coffee Cake!:",'
              '"1.  Preheat the oven to 350°F (175°C) and grease a round or square baking pan. '
              '\n 2.In a medium bowl, whisk together 2 cups of gluten-free flour blend, 1 teaspoon of baking powder, 1/2 teaspoon of baking soda, and 1/4 teaspoon of salt.'
              '\n 3. In a large mixing bowl, cream together 1/2 cup of softened unsalted butter (or dairy-free alternative) and 3/4 cup of granulated sugar until light and fluffy.'
              '\n 4.Beat in 2 large eggs, one at a time, ensuring each egg is fully incorporated before adding the next. '
              '\n 5.Gradually add the dry mixture to the wet ingredients, stirring until just combined. '
              '\n 6.Gently fold in 1 cup of chopped fresh cranberries '
              '\n 7.Pour the batter into the greased baking pan and spread it evenly '
              '\n 8. Bake in the preheated oven for 40-45 minutes, or until a toothpick inserted into the center comes out clean ","assets/images/G1.jpeg","G")'
      )
          .then((value) {print("$value inserted successfully");
      }).catchError((error) {print("erroe from insert $error"); });


      txn.rawInsert(
          'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
              'VALUES("Nutella", "Gluten Free","To make a Nutella!:",'
              '"1. Gather your ingredients: hazelnuts and gluten-free chocolate. '
              '\n 2. Preheat your oven to 350°F (175°C).'
              '\n 3. Spread the hazelnuts in a single layer on a baking sheet'
              '\n 4. Place the baking sheet with the hazelnuts in the preheated oven and toast them for about 10-12 minutes, or until the skins start to crack and peel off '
              '\n 5. Remove the hazelnuts from the oven and let them cool slightly. '
              '\n 6. Once the hazelnuts have cooled a bit, rub them with a clean kitchen towel or between your palms toremove as much of the skin as possible. Its okay if a little bit of skin remains.'
              '\n 7.. Place the skinned hazelnuts in a food processor or high-speed blender. '
              '\n 8. Process the hazelnuts until they turn into a smooth paste. This may take a few minutes, and you may need to scrape down the sides of the processor or blender as needed.'
              '\n 9.  In a microwave-safe bowl or double boiler, melt the gluten-free chocolate until smooth'
              '\n 10. Add the melted chocolate to the hazelnut paste in the food processor or blender.'
              '\n 11. Blend the mixture again until the chocolate is fully incorporated and the Nutella reaches a smoothconsistency '
              '\n 12. Transfer the gluten-free Nutella to a clean, airtight jar or container.","assets/images/G2.jpeg","G")'
      )
          .then((value) {print("$value inserted successfully");
      }).catchError((error) {print("erroe from insert $error"); });

      //--------------------------------------------------------------------------------------------

      txn.rawInsert(
          'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
              'VALUES("zucchini coffee cake", "Lactose free","To make a healthy zucchini coffee cake:",'
              '"1. . Preheat your oven to the recommended temperature, typically around 350°F (175°C), and grease a baking dishor line it with parchment paper.'
              '\n2. Gather the ingredients: You will need grated zucchini, whole wheat flour or a gluten-free flour alternative,almond flour, baking powder, baking soda, cinnamon, nutmeg, salt, eggs (or flax eggs for a vegan option),unsweetened apple sauce, maple syrup or a natural sweetener of your choice, vanilla extract, and chopped nuts or seeds for topping (optional).'
              '\n 3. In a large bowl, combine the dry ingredients:  flour, baking powder, baking soda, cinnamon, nutmeg, and salt. Mix well.'
              '\n 4. In another bowl, whisk the eggs (or prepare flax eggs as per instructions) and add in the grated zucchini, unsweetened apple sauce, maple syrup, and vanilla extract. Stir until well combined.'
              '\n 5. Pour the wet ingredients into the bowl of dry ingredients. Mix gently until all the ingredients are very incorporate.","assets/images/l2.jpeg","L")'
      )
          .then((value) {print("$value inserted successfully");
      }).catchError((error) {print("erroe from insert $error"); });
      txn.rawInsert(
          'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
              'VALUES("pasta salad", "Lactose free","To make a creamy hummus pasta salad:",'
              '"1. Cook pasta until al dente, then rinse with cold water.'
              '\n2. In a bowl, combine pasta, chickpeas, cherry tomatoes, cucumbers, black olives, red onions, and parsley'
              '\n 3. In a separate bowl, mix hummus, lemon juice, olive oil, minced garlic, salt, and pepper to make the dressing'
              '\n 4.  Pour the dressing over the pasta mixture and toss to coat"'
              '\n 5.Adjust seasoning to taste and refrigerate for at least 30 minutes.","assets/images/l3.jpeg","L")'
      ).then((value) {print("$value inserted successfully");
      }).catchError((error) {print("error from insert $error"); });

      txn.rawInsert(
          'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
              'VALUES("Black Raspberry Ice Cream", "Lactose free","To make a Black Raspberry Ice Cream:",'
              '"1. Blend 2 cups of black raspberries until smooth '
              '\n 2.Strain the mixture to remove the seeds'
              '\n 3.Whisk together 1 can of full-fat coconut milk, 1/4 cup maple syrup or agave nectar, and 1 teaspoon vanilla extract'
              '\n 4.Combine the strained raspberry puree with the coconut milk mixture '
              '\n 5.Adjust sweetness to taste '
              '\n 6.Churn the mixture in an ice cream maker until soft-serve consistency '
              '\n 7.Transfer to an airtight container and freeze for 2-3 hours until firm '
              '\n 8. Allow the ice cream to soften briefly before serving" ,"assets/images/l4.jpeg","L")'
      )
          .then((value) {print("$value inserted successfully");
      }).catchError((error) {print("erroe from insert $error"); });


      txn.rawInsert(
          'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
              'VALUES(" peanut butter", "Lactose free","To make a  peanut butter:",'
              '"1. In a mixing bowl, combine oats and peanut butter. Adjust the amount of oats until the mixture holds together.'
              '\n 2.Shape the mixture into small bite-sized balls using your hands.'
              '\n 3. Place the energy bites on a tray or plate.'
              '\n 4.Combine the strained raspberry puree with the coconut milk mixture '
              '\n 5.Adjust sweetness to taste '
              '\n 6.Refrigerate the energy bites for at least 30 minutes to allow them to firm up" ,"assets/images/l7.jpeg","L")'


      )
          .then((value) {print("$value inserted successfully");
      }).catchError((error) {print("erroe from insert $error"); });
      txn.rawInsert(
      'INSERT INTO Test(recipe, type,FirstPara,Para,img,status) '
      'VALUES(" zucchini dish", "Lactose free","To make a zucchini dish:",'
      '"1.  Preheat oven to 400°F (200°C)'
      '\n 2.Slice zucchini and place in a bowl.'
      '\n 3. Drizzle with olive oil and toss to coat.'
      '\n 4. Season with garlic powder, salt, and black pepper. '
      '\n 5.Arrange zucchini on a baking sheet and bake for 15-20 minutes until tender and golden '
      '\n 6.Let cool slightly before serving as a side dish or topping ","assets/images/l6.jpeg","L")'


      )
          .then((value) {print("$value inserted successfully");
      }).catchError((error) {print("erroe from insert $error"); });


      emit(InsertDatabaseState());
    return  getDatabase(database);




    }
    );
  }

  void insertDatabase2({
    required String name,
    required String email,
    required String password,
    required String confrimpassword,
  }) async {
    database?.transaction((txn) {
      txn.rawInsert(
          'INSERT INTO sign(name, email,age,region,password,confirmPass) VALUES("$name", "$email","23","eg","$password","$confrimpassword")'
      ).then((value) {
        print(value);
      }).catchError((error) {
        print(error);
      });

      print("data is inserted2");

      emit(InsertDatabaseState2());
      return getDatabase2(database);
    });
  }

  insertDatabase3() async {
    await database?.transaction((txn) =>
        txn.rawInsert(
            'INSERT INTO blog(paragraph ,img ) VALUES("A gluten-free diet excludes any foods that contain gluten, which is a protein found in wheat and several other grains. It means eating only whole foods that dont contain gluten, such as fruits, vegetables, meat and eggs, as well as processed gluten-free foods like gluten-free bread or pasta.", "gluten free")')
            .then(
                (value) {
              print(
                  "$value inserted successfully blog");
              emit(InsertDatabaseState3());
              getDatabase(database);
            })
            .catchError((error) {
          print("error from insert $error");
        })


    );
  }

  Future<void> updateDatabase(
      {
        required String states,
        required int id
      }
      ) async {
    database?.rawUpdate(
        'UPDATE Test SET status = ? WHERE id = ?',
        ['$states',  '$id']).then((value) {
      getDatabase(database);
      emit(UpdateDatabaseState());
    }).catchError((error){print("error in updates $error");
    }
    );
  }

}
