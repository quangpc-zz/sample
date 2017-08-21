//
//  DetailViewController.swift
//  QuangPC
//
//  Created by robert pham on 8/17/17.
//  Copyright © 2017 quangpc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, MainStoryboardInstance {

    @IBOutlet weak var nameLabel: UILabel!
    
    
    var dev: DevModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameLabel.text = dev?.name
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
