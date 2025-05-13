using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Collections.Generic;

public class EyeDataBuffer : MonoBehaviour
{
    public int T = 76, D = 5;
    Queue<float[]> buffer;
    public float[] means, stds;  // set from training

    void Awake()
    {
        buffer = new Queue<float[]>();
        for (int i = 0; i < T; i++)
            buffer.Enqueue(new float[D]);
    }

    public void AddSample(float[] raw)
    {
        // normalize
        for (int i = 0; i < D; i++)
            raw[i] = (raw[i] - means[i]) / stds[i];
        buffer.Enqueue(raw);
        if (buffer.Count > T) buffer.Dequeue();
    }

    public float[,] GetWindow()
    {
        float[,] window = new float[T, D];
        int i = 0;
        foreach (var sample in buffer)
        {
            for (int j = 0; j < D; j++) window[i, j] = sample[j];
            i++;
        }
        return window;
    }
}
