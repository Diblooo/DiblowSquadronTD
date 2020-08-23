using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using Photon.Pun;
using Photon.Realtime;

[RequireComponent(typeof(Rigidbody))]
[RequireComponent(typeof(NavMeshAgent))]
public class Bot : MonoBehaviourPun
{
    protected Rigidbody botRb;
    protected NavMeshAgent botNavMeshAgent;
    public Transform destination;

    private void Awake()
    {
        botRb = GetComponent<Rigidbody>();
        botNavMeshAgent = GetComponent<NavMeshAgent>();
    }

    private void Start()
    {
        botNavMeshAgent.SetDestination(destination.position);
    }
}
