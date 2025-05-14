using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TensorFlowLite;

public class TFLiteModelRunner : MonoBehaviour
{
    //[Tooltip()]
    public TextAsset modelAsset;      // drag the .tflite here
    Interpreter interpreter;
    int T = 76, D = 5;
    float[,,] inputTensor;
    float[,,] outputTensor;

    void Start()
    {
        Debug.Log($"[TFLiteRunner] GO={gameObject.name}, modelAsset={(modelAsset == null ? "NULL" : modelAsset.name)}");
        if (modelAsset == null)
        {
            Debug.LogError("No modelAsset assigned! Disabling runner.");
            enabled = false;
            return;
        }

        // *** NEW: explicitly create non-null options ***
        var options = new InterpreterOptions();
        // you can tweak number of threads, delegates, etc:
        // options.Threads = 2;
        // options.AddGpuDelegate();

        // Pass your options into the constructor:
        interpreter = new Interpreter(modelAsset.bytes, options);
        interpreter.AllocateTensors();

        inputTensor = new float[1, T, D];
        outputTensor = new float[1, T, 1];

        Debug.Log($"[TFLiteRunner] Loaded model ({modelAsset.bytes.Length} bytes) and allocated tensors");
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

    void OnDestroy()
    {
        if ( interpreter != null)
        {
            interpreter.Dispose();
        }
    }
}
