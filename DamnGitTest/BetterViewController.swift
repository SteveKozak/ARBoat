//
//  BetterViewController.swift
//  ARBoatTest
//
//  Created by GrouchyGirl Studios Inc on 7/26/17.
//  Copyright © 2017 GrouchyGirl Studios Inc. All rights reserved.
//

import Foundation
import UIKit
import SceneKit
import ARKit

class BetterViewController: UIViewController {
    
    //MARK:  IBOutlets
    @IBOutlet weak var sceneView: ARSCNView!
    
    //MARK:  Constant Properties
    
    let movementData = MovementData.sharedInstance
    
    //MARK:  Variable Properties
    var scene: SCNScene!
    var targetOne: SCNNode!
    var targetTwo: SCNNode!
    var lookAtNodeOne: SCNNode!
    var lookAtNodeTwo: SCNNode!
    var boatMoveCount: Int = 0
    var boatTwoMoveCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        scene = SCNScene()
        sceneView.scene = scene
        configureTargetOne()
        configureTargetTwo()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingSessionConfiguration()
        sceneView.session.run(configuration)
    }
    
    func configureTargetOne() {
        targetOne = SCNNode()
        guard let boatScene = SCNScene(named: "art.scnassets/vagabond.dae") else {
            return
        }
        let wrapperNode = SCNNode()
        for child in boatScene.rootNode.childNodes {
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            wrapperNode.addChildNode(child)
        }
        targetOne.addChildNode(wrapperNode)
        targetOne.scale = SCNVector3Make(0.025, 0.04, 0.04)
        targetOne.position = SCNVector3Make(0.2, -0.2, -2.0)
        
        scene.rootNode.addChildNode(targetOne)
        lookAtNodeOne =  SCNNode()
        lookAtNodeOne.position = SCNVector3Make(0.0, 0.0, 0.0)
        let lookAtContraint = SCNLookAtConstraint(target: lookAtNodeOne)
        lookAtContraint.isGimbalLockEnabled = true
        //targetOne.constraints = [lookAtContraint]
        //targetOne.eulerAngles.y = -3.1416
        
    }
    
    func configureTargetTwo() {
        targetTwo = SCNNode()
        guard let boatScene = SCNScene(named: "art.scnassets/vagabond.dae") else {
            return
        }
        let wrapperNode = SCNNode()
        for child in boatScene.rootNode.childNodes {
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            wrapperNode.addChildNode(child)
        }
        targetTwo.addChildNode(wrapperNode)
        targetTwo.scale = SCNVector3Make(0.04, 0.04, 0.04)
        targetTwo.position = SCNVector3Make(-0.2, -0.2, -2.0)
        scene.rootNode.addChildNode(targetTwo)
        lookAtNodeTwo = SCNNode()
        lookAtNodeTwo.position = SCNVector3Make(0.0, 0.0, 0.0)
        let lookAtContraint = SCNLookAtConstraint(target: lookAtNodeOne)
        lookAtContraint.isGimbalLockEnabled = true
        //targetTwo.constraints = [lookAtContraint]
        
    }
    
    func moveTargetOne() {
        let currentPosition = targetOne.position
        let nextPointX = movementData.boatOneWayPoints[boatMoveCount + 1].x
        let currentPointX = movementData.boatOneWayPoints[boatMoveCount].x
        let nextPointZ = movementData.boatOneWayPoints[boatMoveCount + 1].z
        let currentPointZ = movementData.boatOneWayPoints[boatMoveCount].z
        let durtion = TimeInterval(movementData.boatOneWayPoints[boatMoveCount].w)
        let moveToPoint = SCNVector3Make((nextPointX - currentPointX) * 200.0, 0.0, (nextPointZ - currentPointZ) * 200.0)
        lookAtNodeOne.position = currentPosition
        let lookAtConstraint = SCNLookAtConstraint(target: lookAtNodeOne)
        lookAtConstraint.isGimbalLockEnabled = true
        //lookAtConstraint.influenceFactor = 0.07
        targetOne.constraints = [lookAtConstraint]
        targetOne.runAction(SCNAction.move(by: moveToPoint, duration: durtion), completionHandler: {
            self.boatMoveCount += 1
            if self.boatMoveCount < self.movementData.boatOneWayPoints.count - 1 {
                self.moveTargetOne()
            }
        })
    }
    func moveTargetTwo() {
        let currentPosition = targetTwo.position
        let nextPointX = movementData.boatTwoWayPoints[boatTwoMoveCount + 1].x
        let currentPointX = movementData.boatTwoWayPoints[boatTwoMoveCount].x
        let nextPointZ = movementData.boatTwoWayPoints[boatTwoMoveCount + 1].z
        let currentPointZ = movementData.boatTwoWayPoints[boatTwoMoveCount].z
        let durtion = TimeInterval(movementData.boatTwoWayPoints[boatTwoMoveCount].w)
        let moveToPoint = SCNVector3Make((nextPointX - currentPointX) * 200.0, 0.0, (nextPointZ - currentPointZ) * 200.0)
        lookAtNodeTwo.position = currentPosition
        let lookAtConstraint = SCNLookAtConstraint(target: lookAtNodeTwo)
        lookAtConstraint.isGimbalLockEnabled = true
        //lookAtConstraint.influenceFactor = 0.07
        targetTwo.constraints = [lookAtConstraint]
        targetTwo.runAction(SCNAction.move(by: moveToPoint, duration: durtion), completionHandler: {
            self.boatTwoMoveCount += 1
            if self.boatTwoMoveCount < self.movementData.boatTwoWayPoints.count - 1 {
                self.moveTargetTwo()
            }
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveTargetOne()
        moveTargetTwo()
    }
}
