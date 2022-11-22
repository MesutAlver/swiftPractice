//
//  ViewController.swift
//  SolarSystemARKit
//
//  Created by mesut alver on 21.11.2022.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
       
        // let myBox = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
        let mySphere = createSyphere(radius: 0.1, content: "space", vector: SCNVector3(0, 0.1, -1))
        
        sceneView.scene.rootNode.addChildNode(mySphere)
        sceneView.automaticallyUpdatesLighting = true
        
        
        
    }
    
    
    func createSyphere(radius: CGFloat, content: String, vector: SCNVector3)  -> SCNNode {
        
        
        let mySphere = SCNSphere(radius: radius)
        
            let boxMaterial =  SCNMaterial()
        
            boxMaterial.diffuse.contents = UIImage(named: "art/\(content)")
            
            mySphere.materials = [boxMaterial]
        
            let node = SCNNode()
        
            node.position = vector
        
            node.geometry = mySphere
        
        return node
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
