using UnityEngine;
using UnityEngine.UI; // Required for UI components

public class FirstPersonController : MonoBehaviour
{
    public float speed = 5f; // Movement speed
    public float mouseSensitivity = 100f; // Mouse sensitivity
    public Transform cameraTransform; // Reference to the Camera Transform
    public float headBobFrequency = 1.5f; // Frequency of the head bob
    public float headBobAmplitude = 0.1f; // Amplitude of the head bob
    public Image blinkOverlay; // Reference to the UI Image for blinking
    public float blinkDuration = 0.5f; // Total time for one blink (close and open)
    public float blinkInterval = 10f; // Time interval between blinks in seconds

    private float xRotation = 0f; // Vertical camera rotation
    private float headBobTimer = 0f; // Timer for head bobbing
    private Vector3 originalCameraPosition; // Original local position of the camera
    private float blinkTimer = 0f; // Timer for controlling blink intervals
    private bool isBlinking = false; // Flag to check if the screen is currently blinking

    void Start()
    {
        // Lock the cursor to the game window
        Cursor.lockState = CursorLockMode.Locked;

        // Store the original camera position
        originalCameraPosition = cameraTransform.localPosition;

        // Ensure the blink overlay starts as fully transparent
        if (blinkOverlay != null)
        {
            blinkOverlay.color = new Color(0, 0, 0, 0); // Black color, fully transparent
        }
    }

    void Update()
    {
        // Handle blinking
        BlinkEffect();

        // Mouse look (Rotate the camera based on mouse input)
        float mouseX = Input.GetAxis("Mouse X") * mouseSensitivity * Time.deltaTime;
        float mouseY = Input.GetAxis("Mouse Y") * mouseSensitivity * Time.deltaTime;

        xRotation -= mouseY;
        xRotation = Mathf.Clamp(xRotation, -90f, 90f); // Prevent over-rotating the camera vertically

        cameraTransform.localRotation = Quaternion.Euler(xRotation, 0f, 0f);
        transform.Rotate(Vector3.up * mouseX);

        // Movement (WASD input)
        float horizontal = Input.GetAxis("Horizontal"); // A/D
        float vertical = Input.GetAxis("Vertical"); // W/S
        Vector3 direction = transform.right * horizontal + transform.forward * vertical;

        // Move the player object
        transform.Translate(direction * speed * Time.deltaTime, Space.World);

        // Apply head bob effect if moving
        if (direction.magnitude > 0.1f)
        {
            HeadBob();
        }
        else
        {
            // Reset to original camera position if not moving
            cameraTransform.localPosition = Vector3.Lerp(cameraTransform.localPosition, originalCameraPosition, Time.deltaTime * 5f);
            headBobTimer = 0f;
        }
    }

    void HeadBob()
    {
        headBobTimer += Time.deltaTime * headBobFrequency;

        // Calculate head bob offset
        float bobOffset = Mathf.Sin(headBobTimer) * headBobAmplitude;

        // Apply the offset to the camera's local position
        cameraTransform.localPosition = new Vector3(
            originalCameraPosition.x,
            originalCameraPosition.y + bobOffset,
            originalCameraPosition.z
        );
    }

    void BlinkEffect()
    {
        if (isBlinking) return; // If already blinking, do nothing

        blinkTimer += Time.deltaTime;

        if (blinkTimer >= blinkInterval)
        {
            StartCoroutine(Blink());
            blinkTimer = 0f; // Reset the blink timer
        }
    }

    System.Collections.IEnumerator Blink()
    {
        isBlinking = true;

        // Fade to black
        float elapsedTime = 0f;
        while (elapsedTime < blinkDuration / 2f)
        {
            elapsedTime += Time.deltaTime;
            float alpha = Mathf.Lerp(0, 1, elapsedTime / (blinkDuration / 2f));
            blinkOverlay.color = new Color(0, 0, 0, alpha);
            yield return null;
        }

        // Pause briefly while fully black
        yield return new WaitForSeconds(0.1f);

        // Fade back to transparent
        elapsedTime = 0f;
        while (elapsedTime < blinkDuration / 2f)
        {
            elapsedTime += Time.deltaTime;
            float alpha = Mathf.Lerp(1, 0, elapsedTime / (blinkDuration / 2f));
            blinkOverlay.color = new Color(0, 0, 0, alpha);
            yield return null;
        }

        isBlinking = false;
    }
}
