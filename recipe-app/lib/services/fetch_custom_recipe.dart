import 'package:cloud_functions/cloud_functions.dart';

// TODO: calling your customRecipeFlow
/* Hints:
  You can check how food_page.dart calling customRecipesFlow.
  Note that the type of return value is crucial.
*/
Future<Map<String, dynamic>> fetchCustomRecipe(String title, String ingredients, String directions, String improved_suggestion) async {
  try {
    final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
      'customRecipe',
    );

    Map<String, dynamic> recipe = { "title": title, "ingredients": ingredients, "directions": directions };

    final response = await callable.call({
      "suggestRecipe": recipe,
      "ingredients": improved_suggestion,
    });
    final data = Map<String, dynamic>.from(response.data);
    print(response.data["originRecipeImage"]);

    return {
      'recipe': data['recipe'] ?? {},
      'customRecipeImage': {
        'url': data['customRecipeImage']?['url'] ?? '',
        'base64': data['customRecipeImage']?['base64'] ?? '',
      },
      'originRecipeImage': {
        'url': data['originRecipeImage']?['url'] ?? '',
        'base64': data['originRecipeImage']?['base64'] ?? '',
      },
    };

  } catch (e) {
    print("Error calling custom recipe: $e");
    throw Exception("Failed to fetch custom recipe");
  }
}
