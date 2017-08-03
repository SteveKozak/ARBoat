//
//  MovementData.swift
//  ARBoatTest
//
//  Created by GrouchyGirl Studios Inc on 7/15/17.
//  Copyright © 2017 GrouchyGirl Studios Inc. All rights reserved.
//

import Foundation
import SceneKit

class MovementData: NSObject {
    
    static let sharedInstance = MovementData()
    
    var wayPoints = [SCNVector3]()
    var boatOneWayPoints = [SCNVector4]()
    var boatTwoWayPoints = [SCNVector4]()
    
    override init() {
        super.init()
        addWayPoints()
    }
    func addWayPoints() {
        wayPoints.append(SCNVector3(0, 0, 0))
        wayPoints.append(SCNVector3(0.5, 0, 0))
        wayPoints.append(SCNVector3(0.5, 0, 0.5))
        wayPoints.append(SCNVector3(1, 0, 1))
        
        boatOneWayPoints.append(SCNVector4(0.29263, 0, 0.98537, 0))
        boatOneWayPoints.append(SCNVector4(0.29262, 0, 0.98532, 10))
        boatOneWayPoints.append(SCNVector4(0.28821, 0, 0.99292, 10))
        boatOneWayPoints.append(SCNVector4(0.28862, 0, 1.00216, 10))
        boatOneWayPoints.append(SCNVector4(0.28426, 0, 1.00835, 10))
        boatOneWayPoints.append(SCNVector4(0.28262, 0, 1.00228, 2))
        boatOneWayPoints.append(SCNVector4(0.29262, 0, 0.97697, 20))
        boatOneWayPoints.append(SCNVector4(0.30394, 0, 0.95551, 20))
        boatOneWayPoints.append(SCNVector4(0.30668, 0, 0.95668, 2))
        boatOneWayPoints.append(SCNVector4(0.30454, 0, 0.996864, 10))
        boatOneWayPoints.append(SCNVector4(0.2985, 0, 0.9704, 10))
        boatOneWayPoints.append(SCNVector4(0.29805, 0, 0.98302, 10))
        boatOneWayPoints.append(SCNVector4(0.29098, 0, 0.98513, 10))
        
        boatTwoWayPoints.append(SCNVector4(0.29168, 0, 0.98392, 0))
        boatTwoWayPoints.append(SCNVector4(0.28919, 0, 0.98724, 10))
        boatTwoWayPoints.append(SCNVector4(0.29239, 0, 0.99653, 10))
        boatTwoWayPoints.append(SCNVector4(0.28648, 0, 0.99718, 10))
        boatTwoWayPoints.append(SCNVector4(0.28701, 0, 1.00729, 10))
        boatTwoWayPoints.append(SCNVector4(0.28033, 0, 1.00781, 2))
        boatTwoWayPoints.append(SCNVector4(0.28827, 0, 0.98120, 20))
        boatTwoWayPoints.append(SCNVector4(0.30298, 0, 0.9537, 20))
        boatTwoWayPoints.append(SCNVector4(0.30359, 0, 0.95391, 2))
        boatTwoWayPoints.append(SCNVector4(0.30697, 0, 0.95945, 10))
        boatTwoWayPoints.append(SCNVector4(0.29742, 0, 0.96603, 10))
        boatTwoWayPoints.append(SCNVector4(0.29621, 0, 0.98239, 10))
        boatTwoWayPoints.append(SCNVector4(0.29081, 0, 0.98333, 10))
    }
}
