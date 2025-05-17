// UnityWebRequestModelRunner.cs
using System.Collections;
using UnityEngine;
using UnityEngine.Networking;

public class UnityWebRequestModelRunner : MonoBehaviour
{
    public EyeDataBuffer eyeBuffer;         // your normalization + window buffer
    public string serverUrl = "http://127.0.0.1:5000/predict";

    IEnumerator Start()
    {
        // Optionally wait a moment for your server to be ready…
        yield return new WaitForSeconds(1f);
        StartCoroutine(PredictLoop());
    }

    IEnumerator PredictLoop()
    {
        while (true)
        {
            // Gather window
            float[,] window = eyeBuffer.GetWindow();  // [T, D]
            // Build JSON payload
            var wrapper = new { window = window };
            string json = JsonUtility.ToJson(wrapper);

            // POST to Python server
            using var req = new UnityWebRequest(serverUrl, "POST");
            byte[] bodyRaw = System.Text.Encoding.UTF8.GetBytes(json);
            req.uploadHandler = new UploadHandlerRaw(bodyRaw);
            req.downloadHandler = new DownloadHandlerBuffer();
            req.SetRequestHeader("Content-Type", "application/json");

            yield return req.SendWebRequest();

            if (req.result != UnityWebRequest.Result.Success)
            {
                Debug.LogError($"[Model] Error: {req.error}");
            }
            else
            {
                // Parse response: {"comfort": <float>}
                string resp = req.downloadHandler.text;
                var respObj = JsonUtility.FromJson<ComfortResponse>(resp);
                ApplyFoveation(respObj.comfort);
            }

            // Wait for next inference, e.g. every 0.5 s
            yield return new WaitForSeconds(0.5f);
        }
    }

    void ApplyFoveation(float comfort)
    {
        // Map comfort to foveation as you already have:
        float t = Mathf.InverseLerp(1f, 10f, comfort);
        float fovLevel = Mathf.Lerp(3f, 0f, t);
        // (Assuming you already grabbed xrDisplay in another script)
        // xrDisplay.foveatedRenderingLevel = fovLevel;
        // …
    }

    [System.Serializable]
    private class ComfortResponse
    {
        public float comfort;
    }
}
