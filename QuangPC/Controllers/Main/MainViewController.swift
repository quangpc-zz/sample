//
//  MainViewController.swift
//  QuangPC
//
//  Created by robert pham on 8/17/17.
//  Copyright © 2017 quangpc. All rights reserved.
//

import UIKit
import Koloda

// dummy data arrays
let names = ["Clara Smith" , "John Harper", "Sagar Shah", "Bob Thomas", "Sophie Laura","Sammie Lopez","Connie Jones","Camille Rowe","Joana Silver"
,"Sasha Doe","Gaby Simone","Chloe Isabella","George Stanley","Dominic Hope","Sandra Bonhomme","Sophie Gerbault","Sarah Seemore","Rachel Green","Josephine Taylor","Jay Jiang"
,"Hunter Dickson" ,"Sam Gupta","Tom Brady","Taylor Thompson","Tatianna Marshall","Eric Street","Marine Simon","Ronald Duck","Jennifer Lopez"]

let skills = ["Django","Python","Django","React","React","Django"
,"Django","Django","Python","Django","React","React","Django","Django","Django","React","React","Django","Django","Django","React","React","Django","Django","Djago","Python","Python","Python","Python"]

let genders = ["F","M","M","M","F","F","F","F","F","F","F","F","M","M","F","F","F","F","F","M","M","M","M","F","F","M","F","M","F"]

class MainViewController: UIViewController {

    @IBOutlet weak var cardView: KolodaView!
    var devs = [DevModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        
        loadData()
    }
    
    fileprivate func setupViews() {
        cardView.dataSource = self
        cardView.delegate = self
    }
    
    fileprivate func loadData() {
        for i in 0..<names.count {
            let name = names[i]
            let skill = skills[i]
            let genderString = genders[i]
            let gender = (genderString == "F") ? DevGender.female : DevGender.male
            let dev = DevModel(name: name, skill: skill, gender: gender, thumb: "")
            self.devs.append(dev)
        }
        self.cardView.reloadData()
    }
    
}

extension MainViewController: KolodaViewDataSource {
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return devs.count
    }
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let cardView = MainCardView.viewFromNib()
        let dev = self.devs[index]
        cardView.dev = dev
        
        return cardView
    }
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        let overlayView = MainCardOverlayView.viewFromNib()
        
        return overlayView
    }
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return DragSpeed.default
    }
}

extension MainViewController: KolodaViewDelegate {
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        let dev = self.devs[index]
        let vc = DetailViewController.createInstance() as DetailViewController
        vc.dev = dev
        self.present(vc, animated: true, completion: nil)
    }
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        let directionString = direction == .left ? "Left" : "Right"
        print("Direction: \(directionString)")
    }
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        print("Run out of card")
    }
}
