using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR;
using UnityEngine.Rendering.PostProcessing;  // if using Post-Processing v2


public class ComfortBasedFoveation : MonoBehaviour
{
    public ONNXModelRunner modelRunner;
    public EyeDataBuffer eyeBuffer;
    public XRDisplaySubsystem xrDisplay;  // assign via inspector or find at runtime
    public PostProcessVolume ppVolume;    // for Depth of Field
    DepthOfField dof;
    public float minFov = 0f, maxFov = 3f;     // SDK-dependent foveation level
    public float minAperture = 1f, maxAperture = 16f;
    public bool foveEnabled = false; // set to true if XR is running

    void Start()
    {
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
            Debug.LogWarning("No XR display found; foveation DISABLED in Editor");


    }

    void Update()
        {
            if (!foveEnabled) return;

            // 1) collect current eye-tracking sample
            float[] raw = new float[] {
                // fill from your XR SDK’s eye-tracking API
                // e.g. XRInputSubsystem.TryGetEyeTrackingState(...)
            };
            eyeBuffer.AddSample(raw);

            // 2) predict
            float comfort = modelRunner.PredictLatest(eyeBuffer.GetWindow());

            // 3) map comfort [1–10] → foveation level [max→min]
            float t = Mathf.InverseLerp(1f, 10f, comfort);
            float fovLevel = Mathf.Lerp(maxFov, minFov, t);
            xrDisplay.foveatedRenderingLevel = fovLevel;
            xrDisplay.foveatedRenderingFlags = XRDisplaySubsystem.FoveatedRenderingFlags.GazeAllowed;


            // 4) optional DoF: lower comfort → shallow DoF (low aperture)
            if (dof != null)
            {
                dof.aperture.value = Mathf.Lerp(maxAperture, minAperture, t);
            }
        }
}
