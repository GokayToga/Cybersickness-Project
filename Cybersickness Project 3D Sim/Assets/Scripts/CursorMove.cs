using UnityEngine;
using UnityEngine.UI; // For UI components

public class CursorSlidingController : MonoBehaviour
{
    public float cursorSpeed = 5f; // Cursor movement speed
    public float slideSpeed = 10f; // Speed for sliding the player and camera
    public float mouseSensitivity = 100f; // Mouse sensitivity
    public Transform cursor; // Cursor object
    public Transform player; // Player object
    public Transform cameraTransform; // Camera Transform
    public Image blinkOverlay; // UI Image for blinking
    public float blinkDuration = 0.5f; // Total time for one blink (close and open)
    public float blinkInterval = 10f; // Time interval between automatic blinks in seconds

    private bool isSliding = false; // Whether the player is currently sliding
    private Vector3 targetPosition; // Target position for sliding
    private float xRotation = 0f; // Vertical camera rotation
    private float blinkTimer = 0f; // Timer for controlling automatic blinks
    private bool isBlinking = false; // Check if blinking is happening

    void Start()
    {
        // Lock the cursor to the game window
        Cursor.lockState = CursorLockMode.Locked;

        // Ensure the blink overlay starts as fully transparent
        if (blinkOverlay != null)
        {
            blinkOverlay.color = new Color(0, 0, 0, 0); // Black color, fully transparent
        }
    }

    void Update()
    {
        // Handle periodic blinking
        HandleBlinking();

        // Cursor movement (if not sliding or blinking)
        if (!isSliding && !isBlinking)
        {
            float horizontal = Input.GetAxis("Horizontal"); // A/D
            float vertical = Input.GetAxis("Vertical"); // W/S
            Vector3 direction = new Vector3(horizontal, 0, vertical);

            // Move the cursor on the plane
            cursor.Translate(direction * cursorSpeed * Time.deltaTime, Space.World);
        }

        // Trigger sliding on SPACE press
        if (Input.GetKeyDown(KeyCode.Space) && !isSliding && !isBlinking)
        {
            targetPosition = cursor.position;
            isSliding = true;
        }

        // Perform sliding
        if (isSliding)
        {
            Vector3 slidePosition = new Vector3(targetPosition.x, player.position.y, targetPosition.z);
            player.position = Vector3.MoveTowards(player.position, slidePosition, slideSpeed * Time.deltaTime);

            if (Vector3.Distance(player.position, slidePosition) < 0.1f)
            {
                isSliding = false;
            }
        }

        // Keep the camera fixed on the player position
        cameraTransform.position = player.position + new Vector3(0, 1.8f, 0);

        // Handle mouse look
        MouseLook();
    }

    void MouseLook()
    {
        float mouseX = Input.GetAxis("Mouse X") * mouseSensitivity * Time.deltaTime;
        float mouseY = Input.GetAxis("Mouse Y") * mouseSensitivity * Time.deltaTime;

        xRotation -= mouseY;
        xRotation = Mathf.Clamp(xRotation, -90f, 90f);
        cameraTransform.localRotation = Quaternion.Euler(xRotation, 0f, 0f);

        player.Rotate(Vector3.up * mouseX);
    }

    void HandleBlinking()
    {
        // Increment the timer
        blinkTimer += Time.deltaTime;

        // Automatically blink if the timer exceeds the interval
        if (blinkTimer >= blinkInterval && !isBlinking)
        {
            StartCoroutine(Blink());
            blinkTimer = 0f; // Reset the blink timer
        }

        // Manually trigger blink with a key press (e.g., "B")
        if (Input.GetKeyDown(KeyCode.B) && !isBlinking)
        {
            StartCoroutine(Blink());
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
