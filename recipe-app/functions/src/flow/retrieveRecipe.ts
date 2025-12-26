import { z } from "genkit";
import { ai } from "../config";
import { Recipe } from "../type";
import { recipieRetriever } from "../retriever";

export const retrieveRecipeFlow = ai.defineFlow({
  name: 'retrieveRecipeFlow',
  inputSchema: z.string(),
  outputSchema: z.object({
    recipes: z.array(z.object({
      title: z.string(),
      ingredients: z.string(),
      directions: z.string()
    })),
    originRecipeImage: z.object({ url: z.string() })
  })
}, async (input) => {
  const recipes: Recipe[] = await ai.run(
    'Retrieve matching recipes',
    async () => {
      try {
        const docs = await ai.retrieve({
          retriever: recipieRetriever,
          query: input,
          options: { limit: 10 }
        });

        return docs.map((doc) => {
          const data = doc.toJSON();
          return {
            title: data.metadata?.title || 'Untitled Recipe',
            ingredients: data.content[0]?.text || '',
            directions: data.metadata?.directions || ''
          };
        }).filter(Boolean) as Recipe[];
      } catch (error) {
        console.error('Retrieval error:', error);
        return [];
      }
    }
  );

  const uniqueRecipes = Array.from(
    new Map(recipes.map(recipe => [recipe.title, recipe])).values()
  );

  return {
    recipes: Array.from(uniqueRecipes).slice(0, 5),
    originRecipeImage: { url: '' }
  };
});