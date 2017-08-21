//
//  StoryboardHelper.swift
//  Metras
//
//  Created by robert pham on 10/15/16.
//  Copyright © 2016 Metras. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardHelper {
    static func createInstance<T: UIViewController>()-> T
}

protocol MainStoryboardInstance : StoryboardHelper{
    
}

extension MainStoryboardInstance where Self: UIViewController {
    static func createInstance<T: UIViewController>()-> T {
        let st = UIStoryboard(name: "Main", bundle: nil)
        return st.instantiateViewController(withIdentifier: String(describing: self.self)) as! T
    }
}
