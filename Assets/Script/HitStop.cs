using System.Collections;
using UnityEngine;

public class HitStop : MonoBehaviour
{
    public static HitStop Instance;
    [Header("Time Settings")]
    [SerializeField] public float stopTime = 0.1f;
    [SerializeField] public float timeScaleRecoverySpeed = 5f;
    
    [Header("Camera Shake")]
    [SerializeField] public Transform shakeCam;
    [SerializeField] public float shakeIntensity = 0.1f;
    [SerializeField] public float shakeFrequency = 0.1f;

    private bool isHitStopped;
    private Vector3 originalCamPosition;
    private Coroutine shakeCoroutine;

    void Awake()
    {
        Instance = this;
    }
    public void StopTime(float intensity = 1f)
    {
        if(!isHitStopped)
        {
            isHitStopped = true;
            Time.timeScale = 0f;
            
            if(shakeCoroutine != null)
                StopCoroutine(shakeCoroutine);
                
            shakeCoroutine = StartCoroutine(ShakeCamera(intensity));
            StartCoroutine(ReturnTimeScale());
        }
    }

    private IEnumerator ShakeCamera(float intensity)
    {
        originalCamPosition = shakeCam.localPosition;
        float elapsed = 0f;

        while(elapsed < stopTime)
        {
            float x = Random.Range(-1f, 1f) * shakeIntensity * intensity;
            float y = Random.Range(-1f, 1f) * shakeIntensity * intensity;
            
            shakeCam.localPosition = new Vector3(x, y, originalCamPosition.z);
            
            elapsed += Time.unscaledDeltaTime;
            yield return new WaitForSecondsRealtime(shakeFrequency);
        }

        shakeCam.localPosition = originalCamPosition;
    }

    private IEnumerator ReturnTimeScale()
    {
        yield return new WaitForSecondsRealtime(stopTime);
        
        while(Time.timeScale < 1f)
        {
            Time.timeScale = Mathf.MoveTowards(Time.timeScale, 1f, Time.unscaledDeltaTime * timeScaleRecoverySpeed);
            yield return null;
        }
        
        Time.timeScale = 1f;
        isHitStopped = false;
    }
}