using UnityEngine;
using UnityEngine.Networking;
using System.Collections;
using Newtonsoft.Json;

public class PythonModelRunner : MonoBehaviour
{
    public string serverBaseUrl = "http://127.0.0.1:5000";
    bool requestInProgress = false;

    public IEnumerator PredictWindow(float[,] window2d, System.Action<float> callback)
    {
        if (requestInProgress)
            yield break;   // still waiting on last request

        requestInProgress = true;

        // Optional: ping GET for diagnostics
        using (var ping = UnityWebRequest.Get($"{serverBaseUrl}/predict"))
        {
            Debug.Log($"[PythonModelRunner] Pinging GET {serverBaseUrl}/predict");
            yield return ping.SendWebRequest();
            Debug.Log($"[PythonModelRunner] GET ResponseCode={ping.responseCode}, Body={ping.downloadHandler.text}");
        }

        // 1) build jagged array
        int T = window2d.GetLength(0), D = window2d.GetLength(1);
        float[][] jagged = new float[T][];
        for (int t = 0; t < T; t++)
        {
            jagged[t] = new float[D];
            for (int d = 0; d < D; d++)
                jagged[t][d] = window2d[t, d];
        }

        // 2) wrap & serialize
        var reqData = new WindowRequest { window = jagged };
        string json = JsonConvert.SerializeObject(reqData);

        // 3) send POST
        string postUrl = $"{serverBaseUrl}/predict";
        Debug.Log($"[PythonModelRunner] POSTing to {postUrl}  Payload size: {json.Length} chars");
        using (var uw = new UnityWebRequest(postUrl, "POST"))
        {
            uw.uploadHandler = new UploadHandlerRaw(System.Text.Encoding.UTF8.GetBytes(json));
            uw.downloadHandler = new DownloadHandlerBuffer();
            uw.SetRequestHeader("Content-Type", "application/json");

            yield return uw.SendWebRequest();

            Debug.Log($"[PythonModelRunner] POST ResponseCode={uw.responseCode}, Result={uw.result}");

            // robust status check
#if UNITY_2020_1_OR_NEWER
            bool isError = uw.result != UnityWebRequest.Result.Success;
#else
            bool isError = uw.isNetworkError || uw.isHttpError;
#endif
            if (isError)
            {
                Debug.LogError($"[PythonModelRunner] HTTP Error: {uw.responseCode} {uw.error}");
                Debug.LogError($"[PythonModelRunner] Response body:\n{uw.downloadHandler.text}");
                callback?.Invoke(5f);  // fallback
            }
            else
            {
                // 4) parse JSON with Json.NET
                var res = JsonConvert.DeserializeObject<ComfortResponse>(uw.downloadHandler.text);
                callback?.Invoke(res.comfort);
            }
        }

        requestInProgress = false;
    }

    [System.Serializable]
    private class WindowRequest { public float[][] window; }

    [System.Serializable]
    private class ComfortResponse { public float comfort; }
}
