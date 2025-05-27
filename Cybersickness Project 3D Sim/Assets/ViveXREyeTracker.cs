using UnityEngine;
using VIVE.OpenXR;
using VIVE.OpenXR.EyeTracker;

[RequireComponent(typeof(EyeDataBuffer))]
public class ViveXREyeTracker : MonoBehaviour
{
    private EyeDataBuffer eyeBuffer;
    private int D;

    void Start()
    {
        eyeBuffer = GetComponent<EyeDataBuffer>();
        D = eyeBuffer.D;
    }

    void Update()
    {
        float[] raw = new float[D];

        // Retrieve gaze data
        if (XR_HTC_eye_tracker.Interop.GetEyeGazeData(out XrSingleEyeGazeDataHTC[] gazeData))
        {
            var leftGaze = gazeData[(int)XrEyePositionHTC.XR_EYE_POSITION_LEFT_HTC];
            var rightGaze = gazeData[(int)XrEyePositionHTC.XR_EYE_POSITION_RIGHT_HTC];

            if (leftGaze.isValid)
            {
                raw[0] = leftGaze.gazePose.position.x;
                raw[1] = leftGaze.gazePose.position.y;
                raw[2] = leftGaze.gazePose.position.z;
                raw[3] = leftGaze.gazePose.orientation.x;
                raw[4] = leftGaze.gazePose.orientation.y;
                raw[5] = leftGaze.gazePose.orientation.z;
                raw[6] = leftGaze.gazePose.orientation.w;
            }

            if (rightGaze.isValid)
            {
                raw[7] = rightGaze.gazePose.position.x;
                raw[8] = rightGaze.gazePose.position.y;
                raw[9] = rightGaze.gazePose.position.z;
                raw[10] = rightGaze.gazePose.orientation.x;
                raw[11] = rightGaze.gazePose.orientation.y;
                raw[12] = rightGaze.gazePose.orientation.z;
                raw[13] = rightGaze.gazePose.orientation.w;
            }
        }

        // Retrieve pupil data
        if (XR_HTC_eye_tracker.Interop.GetEyePupilData(out XrSingleEyePupilDataHTC[] pupilData))
        {
            var leftPupil = pupilData[(int)XrEyePositionHTC.XR_EYE_POSITION_LEFT_HTC];
            var rightPupil = pupilData[(int)XrEyePositionHTC.XR_EYE_POSITION_RIGHT_HTC];

            if (leftPupil.isDiameterValid)
                raw[14] = leftPupil.pupilDiameter;

            if (rightPupil.isDiameterValid)
                raw[15] = rightPupil.pupilDiameter;
        }

        // Retrieve geometric data
        if (XR_HTC_eye_tracker.Interop.GetEyeGeometricData(out XrSingleEyeGeometricDataHTC[] geoData))
        {
            var leftGeo = geoData[(int)XrEyePositionHTC.XR_EYE_POSITION_LEFT_HTC];
            var rightGeo = geoData[(int)XrEyePositionHTC.XR_EYE_POSITION_RIGHT_HTC];

            if (leftGeo.isValid)
                raw[16] = leftGeo.eyeOpenness;

            if (rightGeo.isValid)
                raw[17] = rightGeo.eyeOpenness;
        }

        // Add timestamp
        raw[18] = Time.time;

        eyeBuffer.AddSample(raw);
    }
}
