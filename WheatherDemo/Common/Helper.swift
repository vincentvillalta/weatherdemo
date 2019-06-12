//
//  Helper.swift
//  WheatherDemo
//
//  Created by Vincent Villalta on 6/11/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

class MaterialColorGenerator {
    
    static var material_colors: [UIColor] = [UIColor(rgb: 0xe57373),
                                             UIColor(rgb: 0xf06292),
                                             UIColor(rgb: 0xba68c8),
                                             UIColor(rgb: 0x9575cd),
                                             UIColor(rgb: 0x7986cb),
                                             UIColor(rgb: 0x64b5f6),
                                             UIColor(rgb: 0x4fc3f7),
                                             UIColor(rgb: 0x4dd0e1),
                                             UIColor(rgb: 0x4db6ac),
                                             UIColor(rgb: 0x81c784),
                                             UIColor(rgb: 0xaed581),
                                             UIColor(rgb: 0xff8a65),
                                             UIColor(rgb: 0xd4e157),
                                             UIColor(rgb: 0xffd54f),
                                             UIColor(rgb: 0xffb74d),
                                             UIColor(rgb: 0xa1887f),
                                             UIColor(rgb: 0x90a4ae)]
    
    static func java_hashcode(key: String) -> Int32{
        var h : Int32 = 0
        for char in key {
            h = 31 &* h &+ Int32(char.unicodeScalars.first!.value)
        }
        return h
    }
    
    static func get_color(key: String) -> UIColor{
        let index : Int = Int(abs(MaterialColorGenerator.java_hashcode(key: key)))
        return material_colors[ index % material_colors.count]
    }
    
}
