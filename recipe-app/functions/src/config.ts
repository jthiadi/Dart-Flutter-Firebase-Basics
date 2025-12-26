import { genkit } from 'genkit';
import { vertexAI } from '@genkit-ai/vertexai';

const firebaseConfig = {
  apiKey: "",
  authDomain: "",
  projectId: "",
  storageBucket: "", // Fixed storage bucket format
  messagingSenderId: "",
  appId: "",
  measurementId: ""
};

export const getProjectId = () => firebaseConfig.projectId;

// enableFirebaseTelemetry({ projectId: getProjectId() });

export const ai = genkit({
  plugins: [
    vertexAI({
      projectId: getProjectId(),
      location: 'us-central1',
    }),
  ],
});
