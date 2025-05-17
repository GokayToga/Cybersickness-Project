from fastapi import FastAPI
from pydantic import BaseModel
import tensorflow as tf
import numpy as np
from typing import List
import tensorflow as tf

print(tf.config.list_physical_devices('GPU'))

app = FastAPI()

# Build the absolute path to the SavedModel directory:
MODEL_DIR  =("C:/Users/togag/Cybersickness-Project/Cybersickness-Project/VRCM_SavedModel")

# 1. Load the SavedModel signature
model = tf.saved_model.load("C:/Users/togag/Cybersickness-Project/Cybersickness-Project/VRCM_SavedModel")
infer = model.signatures["serving_default"]

# 2. Define request/response schemas
class PredictRequest(BaseModel):
    # a single window: list of T rows, each with D floats
    window: list[list[float]]

class PredictResponse(BaseModel):
    comfort: float

class WindowRequest(BaseModel):
    window: List[List[float]]

class ComfortResponse(BaseModel):
    comfort: float
# 3. Spin up FastAPI
app = FastAPI()

@app.post("/predict", response_model=ComfortResponse)
def predict(req: WindowRequest):
    # 1) prepare input
    arr = np.array(req.window, dtype=np.float32)[None, ...]  # shape (1,T,D)
    # 2) convert to tensor and call signature
    inp = tf.constant(arr)                                  # tf.Tensor
    out = infer(input_sequence=inp)          # dict of output tensors :contentReference[oaicite:5]{index=5}
    # 3) extract your comfort value
    comfort = float(out[next(iter(out))].numpy()[0, -1, 0])
    return ComfortResponse(comfort=comfort)
#uvicorn server:app --host 0.0.0.0 --port 5000
