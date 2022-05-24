//
//  File.swift
//  
//
//  Created by Levi Dhuyvetter on 24/05/2022.
//

import Foundation

public protocol QuaternionProtocol {
    associatedtype FP:MathFloatingPoint
    
    var x:FP { get set }
    var y:FP { get set }
    var z:FP { get set }
    var w:FP { get set }
    
    init(x:FP, y:FP, z:FP, w:FP)
}
