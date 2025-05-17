using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR;
using UnityEngine.Rendering.PostProcessing;  // if using Post-Processing v2

public class ComfortBasedFoveation : MonoBehaviour
{
    [Header("Model & Data")]
    public PythonModelRunner modelRunner;
    public EyeDataBuffer eyeBuffer;

    [Header("XR & Foveation")]
    public XRDisplaySubsystem xrDisplay;  // assign via inspector or auto-find
    public float minFov = 0f, maxFov = 3f;

    [Header("Depth of Field (optional)")]
    public PostProcessVolume ppVolume;    // drag your volume here
    public float minAperture = 1f, maxAperture = 16f;
    DepthOfField dof;

    bool foveEnabled = false;
    float lastComfort = 5f; // fallback comfort

    void Start()
    {
        // 1) find XR display
        var displays = new List<XRDisplaySubsystem>();
        SubsystemManager.GetSubsystems(displays);
        foreach (var d in displays)
        {
            if (d.running)
            {
                xrDisplay = d;
                foveEnabled = true;
                Debug.Log("XR display found, foveation ON");
                break;
            }
        }

        if (!foveEnabled)
        {
            Debug.Log("No XR headset—entering TEST mode");
            foveEnabled = true;
            xrDisplay = null;
        }

    }

    void Update()
    {
        if (!foveEnabled) return;

        // 1) your test script is already filling the buffer

        // 2) predict
        float[,] win = eyeBuffer.GetWindow();
        StartCoroutine(modelRunner.PredictWindow(win, comfort =>
        {
            lastComfort = comfort;
        }));

        // 3) compute fovLevel
        float t = Mathf.InverseLerp(1f, 10f, lastComfort);
        float fovLevel = Mathf.Lerp(maxFov, minFov, t);

        if (xrDisplay != null)
        {
            // real headset path
            xrDisplay.foveatedRenderingLevel = fovLevel;
            xrDisplay.foveatedRenderingFlags = XRDisplaySubsystem.FoveatedRenderingFlags.GazeAllowed;
        }
        else
        {
            // TEST mode: just log it
            Debug.Log($"[TEST] comfort={lastComfort:F2}  →  fovLevel={fovLevel:F2}");
        }

    }
}
