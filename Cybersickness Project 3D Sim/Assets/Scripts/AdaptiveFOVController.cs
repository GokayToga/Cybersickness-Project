using UnityEngine;
using UnityEngine.UI;

public class AdaptiveFOVController : MonoBehaviour
{
	public Camera targetCamera;           // The camera whose FOV will be adjusted.
	public Text fovDisplayText;           // UI Text to display the current FOV.
	public float fovAdjustmentRate = 1f;  // How fast the FOV changes per update.
	public float thresholdHigh = 7.0f;    // Score threshold indicating high cybersickness.
	public float thresholdLow = 3.0f;     // Score threshold indicating low cybersickness.
	public float minFOV = 30f;
	public float maxFOV = 120f;

	// Simulated ML model component. In a real integration, this could be your Barracuda inference script.
	// For example, you might have a CybersicknessPredictor component with a method:
	// public float PredictCybersickness();
	// Here, we simulate it with a dummy function.
	public float GetPredictedCybersickness()
	{
		// Replace this with your actual ML inference call.
		// For example, return your ML model's prediction based on current sensor data.
		return Random.Range(0f, 10f);
	}

	void Update()
	{
		// Get the predicted cybersickness score from your ML model.
		float predictedScore = GetPredictedCybersickness();

		// Use the score to determine FOV adjustments.
		// For example: If cybersickness is high, decrease FOV to reduce peripheral stimulation.
		if (predictedScore > thresholdHigh && targetCamera.fieldOfView > minFOV)
		{
			targetCamera.fieldOfView = Mathf.Max(targetCamera.fieldOfView - fovAdjustmentRate * Time.deltaTime, minFOV);
		}
		else if (predictedScore < thresholdLow && targetCamera.fieldOfView < maxFOV)
		{
			targetCamera.fieldOfView = Mathf.Min(targetCamera.fieldOfView + fovAdjustmentRate * Time.deltaTime, maxFOV);
		}

		// Optionally update UI text to show the current FOV and predicted score.
		if (fovDisplayText != null)
		{
			fovDisplayText.text = $"FOV: {targetCamera.fieldOfView:F1}\nScore: {predictedScore:F1}";
		}
	}
}
