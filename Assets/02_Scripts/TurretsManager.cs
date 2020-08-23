using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class TurretsManager : MonoBehaviourPun
{
    public GameObject turretPrefab;
    public Transform turretsRoot;

    private int layerGrid = 1 << 8;

    private void Update()
    {
        if(Input.GetMouseButtonDown(0))
        {
            RaycastHit hit;
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);

            if(Physics.Raycast(ray, out hit, Mathf.Infinity, layerGrid))
            {
                PhotonNetwork.Instantiate(turretPrefab.name, new Vector3(hit.transform.position.x, turretPrefab.transform.position.y, hit.transform.position.z), Quaternion.identity);
            }
        }
    }
}
