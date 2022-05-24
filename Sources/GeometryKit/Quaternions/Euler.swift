//
//  File.swift
//  
//
//  Created by Levi Dhuyvetter on 24/05/2022.
//

import Foundation

public enum EulerOrder {
    case xyz
    case xzy
    case yxz
    case yzx
    case zxy
    case zyx
}

public extension QuaternionProtocol {
    init(radX:FP, radY:FP, radZ:FP, order:EulerOrder = .zyx) {
        let cx = (radX / 2).cos
        let sx = (radX / 2).sin
        let cy = (radY / 2).cos
        let sy = (radY / 2).sin
        let cz = (radZ / 2).cos
        let sz = (radZ / 2).sin
        
        let ccc = (cx * cy * cz)
        let ccs = (cx * cy * sz)
        let csc = (cx * sy * cz)
        let css = (cx * sy * sz)
        let scc = (sx * cy * cz)
        let scs = (sx * cy * sz)
        let ssc = (sx * sy * cz)
        let sss = (sx * sy * sz)
        
        switch order {
        case .xyz: self.init(x: scc + css, y: csc - scs, z: ssc + ccs, w: ccc - sss)
        case .xzy: self.init(x: scc - css, y: csc - scs, z: ssc + ccs, w: sss + ccc)
        case .yxz: self.init(x: css + scc, y: csc - scs, z: ccs - ssc, w: sss + ccc)
        case .yzx: self.init(x: css + scc, y: csc + scs, z: ccs - ssc, w: ccc - sss)
        case .zxy: self.init(x: scc - css, y: scs + csc, z: ccs + ssc, w: ccc - sss)
        case .zyx: self.init(x: scc - css, y: scs + csc, z: ccs - ssc, w: sss + ccc)
        }
    }
    
    init(degX:FP, degY:FP, degZ:FP, order:EulerOrder = .zyx) {
        self.init(radX: degX * (FP.pi / 180), radY: degY * (FP.pi / 180), radZ: degZ * (FP.pi / 180), order: order)
    }
}
