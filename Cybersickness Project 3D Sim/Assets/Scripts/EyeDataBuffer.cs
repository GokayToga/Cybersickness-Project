using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EyeDataBuffer : MonoBehaviour
{
    public int T = 76;            // window length
    public int D = 43;
    //public int D => this.D;// feature dimension
    public float[] means;         // set these in Inspector
    public float[] stds;          // set these in Inspector

Queue<float[]> buffer;

    void Awake()
    {
        /*
        means = new float[43] {
        -0.9599999785f, 133.3833201f, -1.179999948f, 78269.59418f, 19471464295.74f,
        -7.780117669f, 1.115176423f, -27.34713756f, -0.2317258364f, -0.3051175407f,
        0.5084211447f, 0.7640569768f, 34.28287285f, -1.220225331f, -32.32957219f,
        -0.02138706385f, -0.05794757915f, 0.7320674745f, 0.4267059498f, 0.4988461984f,
        2.763340445f, 0.7288875247f, 0.7528941177f, -31.51060712f, -0.3562638189f,
        -34.74553129f, 0.01773871059f, -0.0684892f, 0.737984579f, 0.3986130312f,
        0.4996861233f, 2.602900545f, 0.894261792f, 0.7572089166f, -0.4925909451f,
        136.1930524f, -0.3916184598f, -0.4368538038f, 136.1510253f, -0.3892086341f,
        -0.4211176277f, 135.754332f, -0.4081397118f
    };

        stds = new float[43] {
        1.0f, 88.20517875f, 1.0f, 33082.44993f, 23321516331.63f,
        10.50440236f, 4.395598537f, 13.42308043f, 0.3847427991f, 0.348112952f,
        0.7298796354f, 0.369764456f, 4.419636366f, 7.158163251f, 6.002545115f,
        0.09972342642f, 0.1122118067f, 0.3581047221f, 0.2113329246f, 0.2340598359f,
        1.889569199f, 0.3385301171f, 0.3680578443f, 1.749657071f, 6.43806407f,
        6.544289134f, 0.09392391014f, 0.1056862092f, 0.3598256518f, 0.1679647416f,
        0.1774977273f, 1.831781345f, 0.1589912909f, 0.3692896629f, 1.823820749f,
        88.34648068f, 2.143868739f, 1.83792833f, 88.37173408f, 2.155909488f,
        2.024926383f, 88.23422956f, 2.278671105f
    };
        */
        // sanity checks
        if (means == null || means.Length != D ||
            stds == null || stds.Length != D)
        {
            Debug.LogError("EyeDataBuffer: means/stds must be set and length D");
            enabled = false;
            return;
        }

        buffer = new Queue<float[]>();
        for (int i = 0; i < T; i++)
            buffer.Enqueue(new float[D]);
    }

    public void AddSample(float[] raw)
    {
        if (raw == null || raw.Length != D)
        {
            Debug.LogWarning($"EyeDataBuffer: got length {raw?.Length}, expected {D}. Skipping.");
            return;
        }

        // normalize in place
        var norm = new float[D];
        for (int i = 0; i < D; i++)
        {
            norm[i] = (raw[i] - means[i]) / stds[i];
        }

        buffer.Enqueue(norm);
        if (buffer.Count > T) buffer.Dequeue();
    }

    public float[,] GetWindow()
    {
        var arr = new float[T, D];
        int t = 0;
        foreach (var sample in buffer)
            for (int d = 0; d < D; d++)
                arr[t, d] = sample[d];
        return arr;
    }
}
