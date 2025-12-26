// index.ts
import { onCallGenkit } from 'firebase-functions/https';
//import './flow/customRecipe';
import { customRecipeFlow } from './flow/customRecipe';
import { retrieveRecipeFlow } from './flow/retrieveRecipe';

export const customRecipe = onCallGenkit(customRecipeFlow);
export const retrieveRecipe = onCallGenkit(retrieveRecipeFlow);