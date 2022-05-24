//
//  File.swift
//  
//
//  Created by Levi Dhuyvetter on 24/05/2022.
//

import Foundation
import simd
import GLKit
import SceneKit
import CoreMotion

extension simd_quatd:QuaternionProtocol {
    public var x:Double { get { self.vector.x } set { self.vector.x = newValue } }
    public var y:Double { get { self.vector.y } set { self.vector.y = newValue } }
    public var z:Double { get { self.vector.z } set { self.vector.z = newValue } }
    public var w:Double { get { self.vector.w } set { self.vector.w = newValue } }

    public init(x:Double, y:Double, z:Double, w:Double) {
        self.init(ix: x, iy: y, iz: z, r: w)
    }
}

extension simd_quatf:QuaternionProtocol {
    public var x:Float { get { self.vector.x } set { self.vector.x = newValue } }
    public var y:Float { get { self.vector.y } set { self.vector.y = newValue } }
    public var z:Float { get { self.vector.z } set { self.vector.z = newValue } }
    public var w:Float { get { self.vector.w } set { self.vector.w = newValue } }

    public init(x:Float, y:Float, z:Float, w:Float) {
        self.init(ix: x, iy: y, iz: z, r: w)
    }
}

extension GLKQuaternion:QuaternionProtocol {
    public init(x:Float, y:Float, z:Float, w:Float) {
        self.init(q: (x, y ,z, w))
    }
}

extension SCNQuaternion:QuaternionProtocol {
}

extension CMQuaternion:QuaternionProtocol {
    public init(x: Double, y: Double, z: Double, w: Double) {
        self.init()
        self.x = x
        self.y = y
        self.z = z
        self.w = w
    }
}
