//
//  DevModel.swift
//  QuangPC
//
//  Created by robert pham on 8/17/17.
//  Copyright © 2017 quangpc. All rights reserved.
//

import Foundation

enum DevGender {
    case male, female
}

struct DevModel {
    
    var name: String?
    var skill: String?
    var gender: DevGender = .male
    var thumb: String?
    
}
