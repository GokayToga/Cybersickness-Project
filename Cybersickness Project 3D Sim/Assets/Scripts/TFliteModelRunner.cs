using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using UnityEngine;
using TensorFlowLite;

public class TFLiteModelRunner : MonoBehaviour
{
    public TextAsset modelAsset;      // drag the .tflite here
    Interpreter interpreter;
    int T = 76, D = 5;
    float[,,] inputTensor;
    float[,,] outputTensor;

    void Start()
    {
        interpreter = new Interpreter(modelAsset.bytes);
        interpreter.AllocateTensors();
        inputTensor = new float[1, T, D];
        outputTensor = new float[1, T, 1];
    }

    public float PredictLatest(float[,] window)
    {
        // copy window into inputTensor
        for (int t = 0; t < T; t++)
            for (int d = 0; d < D; d++)
                inputTensor[0, t, d] = window[t, d];
        interpreter.SetInputTensorData(0, inputTensor);
        interpreter.Invoke();
        interpreter.GetOutputTensorData(0, outputTensor);
        // return last timestep’s comfort
        return outputTensor[0, T - 1, 0];
    }

    void OnDestroy() => interpreter.Dispose();
}
