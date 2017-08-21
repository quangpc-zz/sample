//
//  MainCardView.swift
//  QuangPC
//
//  Created by robert pham on 8/17/17.
//  Copyright © 2017 quangpc. All rights reserved.
//

import UIKit
import SDWebImage

class MainCardView: UIView, NibLoadableView {

    @IBOutlet weak var faceImageView: UIImageView!
    @IBOutlet weak var skillLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var genderLabel: UILabel!
    
    
    var gradientLayer: CAGradientLayer!
    
    var dev: DevModel? {
        didSet {
            bindData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        faceImageView.sd_setIndicatorStyle(.white)
        faceImageView.sd_setShowActivityIndicatorView(true)
        createGradientLayer()
    }
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.gradientView.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        self.gradientView.layer.addSublayer(gradientLayer)
    }
    
    fileprivate func bindData() {
        guard let dev = dev else {
            return
        }
        nameLabel.text = dev.name
        skillLabel.text = dev.skill
        genderLabel.text = dev.gender == .male ? "Male" : "Female"
        let thumb = dev.gender == .male ? "http://ncmedia.azureedge.net/ncmedia/2014/09/gates_print.jpg" : "https://s.yimg.com/ny/api/res/1.2/CYUjli2LulT_ktZBDrN1nA--/YXBwaWQ9aGlnaGxhbmRlcjtzbT0xO3c9ODAwO2lsPXBsYW5l/http://media.zenfs.com/en_us/News/ap_webfeeds/c588cc40eec78c13150f6a706700e787.jpg"
        faceImageView.sd_setImage(with: URL(string: thumb), placeholderImage: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.gradientLayer != nil {
            self.gradientLayer.frame = self.gradientView.bounds
        }
    }

}
