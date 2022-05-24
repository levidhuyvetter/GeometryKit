//
//  File.swift
//  
//
//  Created by Levi Dhuyvetter on 24/05/2022.
//

import Foundation
import CoreGraphics

public protocol MathFloatingPoint:FloatingPoint {
    var cos:Self { get }
    var sin:Self { get }
    var double:Double { get }
    
    init(_ d:Double)
}

extension Double:MathFloatingPoint {
    public var cos:Double { Darwin.cos(self) }
    public var sin:Double { Darwin.sin(self) }
    public var double:Double { return self }
}

extension Float:MathFloatingPoint {
    public var cos:Float { Darwin.cos(self) }
    public var sin:Float { Darwin.sin(self) }
    public var double:Double { return Double(self) }
}

extension CGFloat:MathFloatingPoint {
    public var cos:CGFloat { Darwin.cos(self) }
    public var sin:CGFloat { Darwin.sin(self) }
    public var double:Double { return Double(self) }
}
