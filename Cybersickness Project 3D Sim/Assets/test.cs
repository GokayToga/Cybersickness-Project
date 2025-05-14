using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class test : MonoBehaviour
{
    EyeDataBuffer eyeBuffer;
    int D;

    void Start()
    {
        // 1) Find the EyeDataBuffer on this GameObject
        eyeBuffer = GetComponent<EyeDataBuffer>();
        if (eyeBuffer == null)
        {
            Debug.LogError("EyeDataBuffer component not found!");
            enabled = false;
            return;
        }

        // 2) Read how many features it expects per sample
        D = eyeBuffer.D;  // assume your EyeDataBuffer script has "public int D;"
    }

    void Update()
    {
        int D = eyeBuffer.D;     // read from the buffer

        // 3) Build a dummy sample array of length D
        float[] fakeSample = new float[D]; ;

        // Fill it with something oscillating just on element 0
        fakeSample[0] = Mathf.Sin(Time.time);

        // (Optional) give the rest zeros or any pattern you like:
        // for (int i = 1; i < D; i++) fakeSample[i] = 0f;

        // 4) Push it into the buffer
        eyeBuffer.AddSample(fakeSample);
    }
}
