import 'package:cookbook/widgets/recipe_list_card.dart';
import 'package:flutter/material.dart';

class RecipeList extends StatefulWidget {
  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RecipeListCard(
            recipeName: "Panner Masala",
            recipeCuisine: "North Indian",
            addedBy: "Bivek Kumar",
            recipePrepTime: "20 Mins",
            recipeImg: "images/recipe/pannerMasala.png",
          ),
          RecipeListCard(
            recipeName: "Dosa",
            recipeCuisine: "South Indian",
            addedBy: "Bivek Kumar",
            recipePrepTime: "30 Mins",
            recipeImg: "images/recipe/dosa.png",
          ),
          RecipeListCard(
            recipeName: "Momos",
            recipeCuisine: "Chinese",
            addedBy: "Bivek Kumar",
            recipePrepTime: "45 Mins",
            recipeImg: "images/recipe/momos.png",
          ),
          RecipeListCard(
            recipeName: "Pasta",
            recipeCuisine: "Italian",
            addedBy: "Bivek Kumar",
            recipePrepTime: "30 Mins",
            recipeImg: "images/recipe/pasta.png",
          ),
          RecipeListCard(),
          RecipeListCard(),
          RecipeListCard(),
          RecipeListCard(),
        ],
      ),
    );
  }
}
