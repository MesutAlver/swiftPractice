//
//  toDetailsVC.swift
//  SimpsonBook
//
//  Created by mesut alver on 6.11.2022.
//

import UIKit

class toDetailsVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedSimpson : Simpsons?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
        imageView.image = selectedSimpson?.image


    }
    


}
