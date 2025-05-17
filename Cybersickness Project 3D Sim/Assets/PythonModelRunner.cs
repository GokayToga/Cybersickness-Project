using UnityEngine;
using UnityEngine.Networking;
using System.Collections;
using Newtonsoft.Json;

public class PythonModelRunner : MonoBehaviour
{
    public string serverBaseUrl = "http://127.0.0.1:5000";

    public IEnumerator PredictWindow(float[,] window2d, System.Action<float> callback)
    {
        int T = window2d.GetLength(0);
        int D = window2d.GetLength(1);

        // 1) convert to jagged float[][]
        float[][] jagged = new float[T][];
        for (int t = 0; t < T; t++)
        {
            jagged[t] = new float[D];
            for (int d = 0; d < D; d++)
                jagged[t][d] = window2d[t, d];
        }

        // 2) wrap it
        var reqData = new WindowRequest { window = jagged };

        // 3) serialize
        string json = JsonConvert.SerializeObject(reqData);

        // 4) send
        using var uw = new UnityWebRequest($"{serverBaseUrl}/predict", "POST");
        byte[] bodyRaw = System.Text.Encoding.UTF8.GetBytes(json);
        uw.uploadHandler = new UploadHandlerRaw(bodyRaw);
        uw.downloadHandler = new DownloadHandlerBuffer();
        uw.SetRequestHeader("Content-Type", "application/json");

        yield return uw.SendWebRequest();

        if (uw.result != UnityWebRequest.Result.Success)
        {
            Debug.LogError($"[PythonModelRunner] HTTP Error: {uw.responseCode} {uw.error}");
            Debug.LogError($"[PythonModelRunner] Response body:\n{uw.downloadHandler.text}");
            callback?.Invoke(5f);  // fallback
            yield break;
        }


        // 5) parse response {"comfort": ...}
        var res = JsonUtility.FromJson<ComfortResponse>(uw.downloadHandler.text);
        callback?.Invoke(res.comfort);
    }

    [System.Serializable]
    private class ComfortResponse
    {
        public float comfort;
    }

    [System.Serializable]
    private class WindowRequest
    {
        public float[][] window;
    }
}
