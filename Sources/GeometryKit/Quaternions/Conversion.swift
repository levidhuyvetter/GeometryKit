//
//  File.swift
//  
//
//  Created by Levi Dhuyvetter on 24/05/2022.
//

import Foundation
import CoreGraphics

public extension QuaternionProtocol {
    init<Q:QuaternionProtocol>(_ q:Q) where Q.FP == Self.FP {
        self.init(x: q.x, y: q.y, z: q.z, w: q.w)
    }
    
    init<Q:QuaternionProtocol>(_ q:Q) where Q.FP == Double, Self.FP == Float {
        self.init(x: Float(q.x), y: Float(q.y), z: Float(q.z), w: Float(q.w))
    }
    
    init<Q:QuaternionProtocol>(_ q:Q) where Q.FP == CGFloat, Self.FP == Float {
        self.init(x: Float(q.x), y: Float(q.y), z: Float(q.z), w: Float(q.w))
    }
    
    init<Q:QuaternionProtocol>(_ q:Q) where Q.FP == Float, Self.FP == Double {
        self.init(x: Double(q.x), y: Double(q.y), z: Double(q.z), w: Double(q.w))
    }
    
    init<Q:QuaternionProtocol>(_ q:Q) where Q.FP == CGFloat, Self.FP == Double {
        self.init(x: Double(q.x), y: Double(q.y), z: Double(q.z), w: Double(q.w))
    }
    
    init<Q:QuaternionProtocol>(_ q:Q) where Q.FP == Float, Self.FP == CGFloat {
        self.init(x: CGFloat(q.x), y: CGFloat(q.y), z: CGFloat(q.z), w: CGFloat(q.w))
    }
    
    init<Q:QuaternionProtocol>(_ q:Q) where Q.FP == Double, Self.FP == CGFloat {
        self.init(x: CGFloat(q.x), y: CGFloat(q.y), z: CGFloat(q.z), w: CGFloat(q.w))
    }
}
