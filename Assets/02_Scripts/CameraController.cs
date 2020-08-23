using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    public float sidesSize = 50f;
    public float speed = 5f;

    private void Start()
    {
        Cursor.lockState = CursorLockMode.Confined;
    }

    private void Update()
    {
        if(Input.mousePosition.x > Screen.width - sidesSize)
        {
            transform.position += new Vector3(speed * Time.deltaTime, 0 , 0);
        }
        else if(Input.mousePosition.x < sidesSize)
        {
            transform.position -= new Vector3(speed * Time.deltaTime, 0, 0);
        }


        if(Input.mousePosition.y > Screen.height - sidesSize)
        {
            transform.position += new Vector3(0, 0, speed * Time.deltaTime);
        }
        else if(Input.mousePosition.y < sidesSize)
        {
            transform.position -= new Vector3(0, 0, speed * Time.deltaTime);
        }
    }

}
