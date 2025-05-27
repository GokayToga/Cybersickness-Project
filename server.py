from fastapi import FastAPI
from pydantic import BaseModel
import tensorflow as tf
import numpy as np
from typing import List
import tensorflow as tf
from typing import List

#print(tf.config.list_physical_devices('GPU'))

app = FastAPI()

# Build the absolute path to the SavedModel directory:
MODEL_DIR = "C:/Users/Administrator/Desktop/Cybersickness-Project/VRCM_Final_model"



# 1. Load the SavedModel signature
model = tf.saved_model.load(MODEL_DIR)
infer = model.signatures["serving_default"]

# 2. Define request/response schemas
class PredictRequest(BaseModel):
    # a single window: list of T rows, each with D floats
    window: List[List[float]]

class PredictResponse(BaseModel):
    comfort: float

class WindowRequest(BaseModel):
    window: List[List[float]]

# --- GET handler for diagnostics ---
@app.get("/predict")
def predict_get():
    return {"detail": "This endpoint expects a POST with JSON body {\"window\": [[...],…]}."}

class ComfortResponse(BaseModel):
    comfort: float
# 3. Spin up FastAPI
#app = FastAPI()

@app.post("/predict", response_model=ComfortResponse)
def predict(req: WindowRequest):
    # 1) prepare input
    arr = np.array(req.window, dtype=np.float32)[None, ...]  # shape (1,T,D)
    # 2) convert to tensor and call signature
    inp = tf.constant(arr)                                  # tf.Tensor
    out = infer(input_sequence=inp)          # dict of output tensors :contentReference[oaicite:5]{index=5}
    # 3) extract your comfort value
    key = next(iter(out))
    comfort = float(out[key].numpy()[0, -1, 0])
    return ComfortResponse(comfort=comfort)
#uvicorn server:app --host 0.0.0.0 --port 5000
#C:\Users\Administrator\Desktop\Cybersickness-Project
#venv\Scripts\Activate.ps1