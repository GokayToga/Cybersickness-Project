using Unity.Barracuda;
using UnityEngine;

public class ONNXModelRunner : MonoBehaviour
{
    public NNModel modelAsset;    // Drag model_fixed.onnx here
    private Model runtimeModel;
    private IWorker worker;

    public int T = 76, D = 5;      // match your model’s input shape
    private float[,,] inputTensor;
    private float[,,] outputTensor;

    void Start()
    {
        // 1) Load the Barracuda Model from the NNModel asset
        runtimeModel = ModelLoader.Load(modelAsset);
        // 2) Create a worker (execution engine). You can choose Compute or CPU.
        worker = WorkerFactory.CreateWorker(WorkerFactory.Type.ComputePrecompiled, runtimeModel);

        inputTensor = new float[1, T, D];
        outputTensor = new float[1, T, 1];

        Debug.Log($"[ONNXRunner] Loaded {modelAsset.name}, created worker");
    }

    public float PredictLatest(float[,] window)
    {
        // 3) Copy data into a Barracuda Tensor
        using (var tensor = new Tensor(1, T, D, 1))
        {
            for (int t = 0; t < T; t++)
                for (int d = 0; d < D; d++)
                    tensor[0, t, d, 0] = window[t, d];

            // 4) Execute the model
            worker.Execute(tensor);

            // 5) Fetch the output tensor
            var output = worker.PeekOutput();
            float comfort = output[0, T - 1, 0, 0];
            output.Dispose();
            return comfort;
        }
    }

    void OnDestroy()
    {
        worker?.Dispose();
    }
}
