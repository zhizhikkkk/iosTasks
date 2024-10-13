//
//  Sound.swift
//  Xylophone
//
//  Created by Arman Sarvardin on 12.10.2024.
//

import Foundation

enum Sound {
    case c, d, e, f, g, a, b
    
    var filename: String {
        switch self {
        case .c: return "C"
        case .d: return "D"
        case .e: return "E"
        case .f: return "F"
        case .g: return "G"
        case .a: return "A"
        case .b: return "B"
        }
    }
    
    init?(with tag: Int) {
        switch tag {
            
        case 0: self = .c
        case 1: self = .d
        case 2: self = .e
        case 3: self = .f
        case 4: self = .g
        case 5: self = .a
        case 6: self = .b
            
        default: return nil
        }
    }
}
