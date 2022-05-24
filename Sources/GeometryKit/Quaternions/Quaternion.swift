//
//  File.swift
//  
//
//  Created by Levi Dhuyvetter on 24/05/2022.
//

import Foundation

public struct Quaternion<FP:MathFloatingPoint>:QuaternionProtocol {
    public var x:FP
    public var y:FP
    public var z:FP
    public var w:FP
    
    public init(x:FP, y:FP, z:FP, w:FP) {
        self.x = x
        self.y = y
        self.z = z
        self.w = w
    }
}
