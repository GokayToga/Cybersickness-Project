using TMPro; // Import TextMeshPro namespace
using UnityEngine;
using UnityEngine.UI;

public class CameraFOVController : MonoBehaviour
{
    public Camera targetCamera; // Assign your camera in the Inspector
    public Text text; // Assign your UI Text in the Inspector
    public float fovIncrement = 5f;
    public float minFOV = 30f;
    public float maxFOV = 120f;

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.O)) // Press 'O' to increase FOV
        {
            IncreaseFOV();
        }

        if (Input.GetKeyDown(KeyCode.P)) // Press 'P' to decrease FOV
        {
            DecreaseFOV();
        }

        // Update the UI text
        if (text != null && targetCamera != null)
        {
            text.text = $"FOV: {targetCamera.fieldOfView:F1}";
        }
    }

    void IncreaseFOV()
    {
        if (targetCamera != null)
        {
            targetCamera.fieldOfView = Mathf.Clamp(targetCamera.fieldOfView + fovIncrement, minFOV, maxFOV);
        }
    }

    void DecreaseFOV()
    {
        if (targetCamera != null)
        {
            targetCamera.fieldOfView = Mathf.Clamp(targetCamera.fieldOfView - fovIncrement, minFOV, maxFOV);
        }
    }
}