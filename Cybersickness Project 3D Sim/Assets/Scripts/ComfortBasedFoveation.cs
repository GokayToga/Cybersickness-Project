using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR;

[RequireComponent(typeof(EyeDataBuffer), typeof(PythonModelRunner))]
public class ComfortBasedFoveation : MonoBehaviour
{
    EyeDataBuffer eyeBuffer;
    PythonModelRunner modelRunner;

    XRDisplaySubsystem xrDisplay;
    InputDevice eyeDevice;

    public float minLevel = 0f;
    public float maxLevel = 1f;

    bool requestInFlight = false;

    void Start()
    {
        eyeBuffer = GetComponent<EyeDataBuffer>();
        modelRunner = GetComponent<PythonModelRunner>();

        // Find XR display
        var displays = new List<XRDisplaySubsystem>();
        SubsystemManager.GetSubsystems(displays);
        if (displays.Count > 0)
        {
            xrDisplay = displays[0];
            xrDisplay.foveatedRenderingFlags = XRDisplaySubsystem.FoveatedRenderingFlags.GazeAllowed;
        }

        // Find eye tracking device
        var devices = new List<InputDevice>();
        InputDevices.GetDevicesWithCharacteristics(
            InputDeviceCharacteristics.EyeTracking | InputDeviceCharacteristics.HeadMounted,
            devices);

        if (devices.Count > 0)
            eyeDevice = devices[0];
        else
            Debug.LogWarning("No eye-tracking device found.");
    }

    void Update()
    {
   

        // --- B) Predict if no request in flight
        if (!requestInFlight && xrDisplay != null)
        {
            requestInFlight = true;
            float[,] window = eyeBuffer.GetWindow();

            StartCoroutine(modelRunner.PredictWindow(window, comfort =>
            {
                float t = Mathf.InverseLerp(1f, 10f, comfort);
                float fovLevel = Mathf.Lerp(maxLevel, minLevel, t);
                xrDisplay.foveatedRenderingLevel = fovLevel;
                requestInFlight = false;
            }));
        }
    }
}
