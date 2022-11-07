//
//  toSecondView.swift
//  actorBook
//
//  Created by mesut alver on 7.11.2022.
//

import UIKit

class toSecondView: UIViewController {

    
    @IBOutlet weak var nameInFılmLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var selectedMatrix : Matrix?
    
    var isMorpheus = true
    var isNeo = true
    var isTrinity = true
    var isSmith = true
    var isCypher = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        
        imageView.addGestureRecognizer(gestureRecognizer)
        
        nameLabel.text = selectedMatrix?.name
        nameInFılmLabel.text = selectedMatrix?.nameInFilm
        imageView.image = selectedMatrix?.image
        ageLabel.text = String (selectedMatrix!.age)


    }
    
    @objc func changePic(){
        if isNeo  == true {
            imageView.image = UIImage(named: "neo")
            nameLabel.text = "Neo"
            isNeo = false
        } else {
            imageView.image = UIImage(named: "keanu")
            nameLabel.text = "Kean Reeves"
            isNeo = true
        }
        
    }
    
    



}
