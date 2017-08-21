//
//  MainCardOverlayView.swift
//  QuangPC
//
//  Created by robert pham on 8/17/17.
//  Copyright © 2017 quangpc. All rights reserved.
//

import UIKit
import Koloda

class MainCardOverlayView: OverlayView, NibLoadableView {

    @IBOutlet weak var statusLabel: UILabel!
    
    override var overlayState: SwipeResultDirection? {
        didSet {
            switch overlayState {
            case .left?:
                self.statusLabel.text = "LIKE"
                self.statusLabel.textColor = UIColor.orange
            case .right?:
                self.statusLabel.text = "IGNORE"
                self.statusLabel.textColor = UIColor.gray
            default:
                break
            }
        }
    }
    
    
}
