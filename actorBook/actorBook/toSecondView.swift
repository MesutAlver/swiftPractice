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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedMatrix?.name
        nameInFılmLabel.text = selectedMatrix?.nameInFilm
        imageView.image = selectedMatrix?.image
        ageLabel.text = String (selectedMatrix!.age)


    }



}
