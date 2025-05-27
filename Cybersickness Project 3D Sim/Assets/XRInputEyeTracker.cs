using UnityEngine;
using UnityEngine.XR;
using System.Collections.Generic;

[RequireComponent(typeof(EyeDataBuffer))]
public class XRInputEyeTracker : MonoBehaviour
{
    EyeDataBuffer eyeBuffer;
    List<InputDevice> devices = new List<InputDevice>();

    void Start()
    {
        eyeBuffer = GetComponent<EyeDataBuffer>();

        // Find the center-eye (or left/right) device that supports eye tracking
        InputDevices.GetDevicesWithCharacteristics(
            InputDeviceCharacteristics.EyeTracking | InputDeviceCharacteristics.HeadMounted,
            devices);
    }

    void Update()
    {
        if (devices.Count == 0)
        {
            // try again if nothing found
            InputDevices.GetDevicesWithCharacteristics(
                InputDeviceCharacteristics.EyeTracking | InputDeviceCharacteristics.HeadMounted,
                devices);
            if (devices.Count == 0) return;
        }

        // Use the first eye-tracking device
        var device = devices[0];

        // Prepare a raw feature array of length D
        int D = eyeBuffer.D;
        var raw = new float[D];

        // 1) Gaze origin and direction (3 + 3 dims)
        if (device.TryGetFeatureValue(CommonUsages.devicePosition, out Vector3 origin))
        {
            raw[0] = origin.x;
            raw[1] = origin.y;
            raw[2] = origin.z;
        }
        if (device.TryGetFeatureValue(CommonUsages.deviceRotation, out Quaternion rot))
        {
            Vector3 dir = rot * Vector3.forward;
            raw[3] = dir.x;
            raw[4] = dir.y;
            raw[5] = dir.z;
        }

        // 2) Pupil diameter / openness (vendor-specific; check your SDK)
        //    e.g. Oculus: CommonUsages.eyesData or Oculus-specific APIs.
        //    raw[6] = ...;

        // 3) Blink / fixation count — if available in your SDK
        //    raw[7] = ...;

        // 4) Any other eye features you need...
        //    Fill the rest of raw[8..D-1] appropriately.

        // Finally, add to the buffer (it will normalize internally)
        eyeBuffer.AddSample(raw);
    }
}
