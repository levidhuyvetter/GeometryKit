//
//  File.swift
//  
//
//  Created by Levi Dhuyvetter on 24/05/2022.
//

import Foundation
import simd

public extension QuaternionProtocol {
    var conjugated:Self {
        return Self.init(x: -self.x, y: -self.y, z: -self.z, w: self.w)
    }
    
    var negated:Self {
        return Self.init(x: -self.x, y: -self.y, z: -self.z, w: -self.w)
    }
    
    var normalised:Self {
        let n = sqrt(self.x * self.x + self.y * self.y + self.z * self.z + self.w * self.w)
        return Self.init(x: self.x / n, y: self.y / n, z: self.z / n, w: self.w / n)
    }
    
    var inversed:Self {
        return self.conjugated.normalised
    }
    
    func multiplied(by q:Self) -> Self {
        let xw = self.x * q.w
        let xz = self.x * q.z
        let xy = self.x * q.y
        let xx = self.x * q.x
        let yw = self.y * q.w
        let yz = self.y * q.z
        let yy = self.y * q.y
        let yx = self.y * q.x
        let zw = self.z * q.w
        let zz = self.z * q.z
        let zy = self.z * q.y
        let zx = self.z * q.x
        let ww = self.w * q.w
        let wz = self.w * q.z
        let wy = self.w * q.y
        let wx = self.w * q.x
        
        let x = xw + yz - zy + wx
        let y = -xz + yw + zx + wy
        let z = xy - yx + zw + wz
        let w = -xx - yy - zz + ww
        
        return Self.init(x: x, y: y, z: z, w: w)
    }
    
    func deconstructed(vector v:(x:FP, y:FP, z:FP)) -> (twist:Self, swing:Self) {
        let d = simd_normalize(simd_double3(x: v.x.double, y: v.y.double, z: v.z.double))
        let ra = simd_double3(x: self.x.double, y: self.y.double, z: self.z.double)
        let p = simd_project(ra, d)
        let twist = Self.init(x: FP(p.x), y: FP(p.y), z: FP(p.z), w: self.w).normalised
        let swing = self.multiplied(by: twist.inversed)
        
        return (twist, swing)
    }
}
