using UnityEngine;

public class EyeBufferTester : MonoBehaviour
{
    EyeDataBuffer eyeBuffer;
    int D;

    void Start()
    {
        eyeBuffer = GetComponent<EyeDataBuffer>();
        if (eyeBuffer == null)
        {
            Debug.LogError("No EyeDataBuffer found on this GameObject!");
            enabled = false;
            return;
        }
        D = eyeBuffer.D;
    }

    void Update()
    {
        // create a dummy sample of length D
        var fake = new float[D];
        // oscillate just feature 0 between -1 and 1
        fake[0] = Mathf.Sin(Time.time);
        // leave the rest zero
        eyeBuffer.AddSample(fake);
    }
}
